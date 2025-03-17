from django.db.models import Count
from django.db.models import Q
from django.shortcuts import render, redirect, get_object_or_404
import datetime
import openpyxl

import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)

from sklearn.feature_extraction.text import CountVectorizer

from sklearn.tree import DecisionTreeClassifier

from sklearn.ensemble import VotingClassifier
#model selection
from sklearn.metrics import confusion_matrix, accuracy_score, plot_confusion_matrix, classification_report
# Create your views here.
from Remote_User.models import ClientRegister_Model,escalation_attack_detection,detection_ratio,detection_accuracy

def login(request):


    if request.method == "POST" and 'submit1' in request.POST:

        username = request.POST.get('username')
        password = request.POST.get('password')
        try:
            enter = ClientRegister_Model.objects.get(username=username,password=password)
            request.session["userid"] = enter.id

            return redirect('ViewYourProfile')
        except:
            pass

    return render(request,'RUser/login.html')

def Add_DataSet_Details(request):

    return render(request, 'RUser/Add_DataSet_Details.html', {"excel_data": ''})


def Register1(request):

    if request.method == "POST":
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        phoneno = request.POST.get('phoneno')
        country = request.POST.get('country')
        state = request.POST.get('state')
        city = request.POST.get('city')
        ClientRegister_Model.objects.create(username=username, email=email, password=password, phoneno=phoneno,
                                            country=country, state=state, city=city)

        return render(request, 'RUser/Register1.html')
    else:
        return render(request,'RUser/Register1.html')

def ViewYourProfile(request):
    userid = request.session['userid']
    obj = ClientRegister_Model.objects.get(id= userid)
    return render(request,'RUser/ViewYourProfile.html',{'object':obj})


def Predict_Escalation_Attack_Detection(request):
    if request.method == "POST":
        if request.method == "POST":

            subject= request.POST.get('subject')
            email_message= request.POST.get('email_message')


        data = pd.read_csv("Datasets.csv",encoding='latin-1')

        def mapping(label):
            if (label == 0):
                return 0  # Escalation Attack not Found
            elif (label ==1):
                return 1  # Escalation Attack Found

        data['Results'] = data['label'].apply(mapping)

        x = data['email_message']
        y = data['Results']

        cv = CountVectorizer(lowercase=False, strip_accents='unicode', ngram_range=(1, 1))

        print(x)
        print("Y")
        print(y)

        x = cv.fit_transform(x)

        models = []
        from sklearn.model_selection import train_test_split
        X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.20)
        X_train.shape, X_test.shape, y_train.shape


        print("KNeighborsClassifier")
        from sklearn.neighbors import KNeighborsClassifier
        kn = KNeighborsClassifier()
        kn.fit(X_train, y_train)
        knpredict = kn.predict(X_test)
        print("ACCURACY")
        print(accuracy_score(y_test, knpredict) * 100)
        print("CLASSIFICATION REPORT")
        print(classification_report(y_test, knpredict))
        print("CONFUSION MATRIX")
        print(confusion_matrix(y_test, knpredict))
        models.append(('KNeighborsClassifier', kn))

        print("Random Forest Classifier")
        from sklearn.ensemble import RandomForestClassifier
        rf_clf = RandomForestClassifier()
        rf_clf.fit(X_train, y_train)
        rfpredict = rf_clf.predict(X_test)
        print("ACCURACY")
        print(accuracy_score(y_test, rfpredict) * 100)
        print("CLASSIFICATION REPORT")
        print(classification_report(y_test, rfpredict))
        print("CONFUSION MATRIX")
        print(confusion_matrix(y_test, rfpredict))
        models.append(('RandomForestClassifier', rf_clf))

        # SVM Model
        print("SVM")
        from sklearn import svm
        lin_clf = svm.LinearSVC()
        lin_clf.fit(X_train, y_train)
        predict_svm = lin_clf.predict(X_test)
        svm_acc = accuracy_score(y_test, predict_svm) * 100
        print(svm_acc)
        print("CLASSIFICATION REPORT")
        print(classification_report(y_test, predict_svm))
        print("CONFUSION MATRIX")
        print(confusion_matrix(y_test, predict_svm))
        models.append(('svm', lin_clf))

        print("Logistic Regression")

        from sklearn.linear_model import LogisticRegression
        reg = LogisticRegression(random_state=0, solver='lbfgs').fit(X_train, y_train)
        y_pred = reg.predict(X_test)
        print("ACCURACY")
        print(accuracy_score(y_test, y_pred) * 100)
        print("CLASSIFICATION REPORT")
        print(classification_report(y_test, y_pred))
        print("CONFUSION MATRIX")
        print(confusion_matrix(y_test, y_pred))
        models.append(('logistic', reg))



        classifier = VotingClassifier(models)
        classifier.fit(X_train, y_train)
        y_pred = classifier.predict(X_test)

        email_message1 = [email_message]
        vector1 = cv.transform(email_message1).toarray()
        predict_text = classifier.predict(vector1)

        pred = str(predict_text).replace("[", "")
        pred1 = str(pred.replace("]", ""))

        prediction = int(pred1)

        if prediction == 0:
            val = 'Escalation Attack not Found'
        elif prediction == 1:
            val = 'Escalation Attack Found'


        print(prediction)
        print(val)

        escalation_attack_detection.objects.create(
        subject=subject,
        email_message=email_message,
        Prediction=val)

        return render(request, 'RUser/Predict_Escalation_Attack_Detection.html',{'objs': val})
    return render(request, 'RUser/Predict_Escalation_Attack_Detection.html')



