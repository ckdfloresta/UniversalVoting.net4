using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using Newtonsoft.Json;
using System.ServiceModel.Channels;
using System.ServiceModel.Web;
using System.Web.Script.Services;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    bool HasError();

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string Error();

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string IsConnected();

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void KFspAddConNum(string fname, string lname, int eventID, int connum);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void KFspAddExistingPersontoContestant(string fname, string lname, int eventID);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void KFspAddPersonToContestant(string fname, string lname, int eventID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string KFspCheckConExistance(string fname, string lname, int eventID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string KFspCheckconnameavailability(string fname, string lname);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string KFspCheckEventAccount(string epname, string euname);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string KFspCheckEventName(string ename);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string KFspCheckEventPerson(string efname, string elname);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void KFspCreateEvent(string efname, string elname, string epname, string ename, string euname);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void KFspFinalizeEvent(string eventid);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void KFspPopulateScores(string confname, string conlname, string judgefname, string judgelname, string judgeuname, string judgepass, int eventid, string critname);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void KFspRemoveContsestantFromEvent(string fname, string lname, string eventid);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void KFspUpdateContestant(string fname, string lname, int perid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string KFspViewEventContestants(int eventid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string KFspViewNotEventContestants(int eventid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspGetEventCriteriaID(string Name, int EventJudgeID);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void MCspUpdateScore(int EventJudgeID, int ContestantID, int EventCriteriaID, float Score);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewContestant(int ContestantID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewContestants(string EventName);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewContestantsEvent(int EventID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewCriteria(int EventJudgeID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewJudgeEvent(string EventName, int JID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewJudges(int JudgeID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewOfficialResults(int EventID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewScore(int EventJudgeID, int ContestantID, int EventCriteriaID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewScoreWeight(int ContestantID, int EventJudgeID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string MCspViewStatus(string EventName, int JudgeID, int ContestantID);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void spAddCriteriaToEventCriteria(string cname, int weight, int eventid);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void spAddJudgeToEventJudges(string fname, string lname, string uname, string pass, int eventid);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void spAddOldCriteriaToEventCriteria(string cname, int weight, int eventid);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void spAddPersonToEventJudges(string fname, string lname, string uname, string pass, int eventid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string spCheckCExistance(string cname, int eventid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string spCheckcnameavailability(string cname);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string spCheckPersonExistanceinEvent(string fname, string lname, string uname, string pass, int eventid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string spCheckUnameavailability(string judgechars);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void spRemoveCriteriaFromEventCriteria(string cname, int eventid);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void spRemoveJudgefromEventJudges(string fname, string lname, string uname, string pass);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void spUpdateEventCriteria(string cname, int weight, int eventid, int critid);

    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    void spUpdatePersonJudgeDetails(int personid, string fname, string lname, string uname, string pass, int eventid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string spViewEventCriteria(int eventid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string spViewEventJudges(int eventid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string spViewJudgeUsingJudgeID(int JudgeID);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string spViewNotEventCriteria(int eventid);

    [OperationContract]
    [WebInvoke(Method = "GET", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]
    string spViewNotEventJudges(int eventid);

    //Dotnet 4 functions
    [OperationContract]
    [WebInvoke(Method = "POST", BodyStyle = WebMessageBodyStyle.Wrapped, ResponseFormat = WebMessageFormat.Json)]

   // [ScriptMethod(UseHttpGet = true)]

    string index_login_OnClick(string uname, string pass);
}