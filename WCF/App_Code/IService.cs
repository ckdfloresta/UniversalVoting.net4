using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using Newtonsoft.Json;
using System.ServiceModel.Channels;
using System.ServiceModel.Web;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
    [OperationContract]
    void KFspAddConNum(string fname, string lname, int eventID, int connum);
    [OperationContract]
    void KFspAddExistingPersontoContestant(string fname, string lname, int eventID);
    [OperationContract]
    void KFspAddPersonToContestant(string fname, string lname, int eventID);
    [OperationContract]
    string KFspCheckConExistance(string fname, string lname, int eventID);
    [OperationContract]
    string KFspCheckconnameavailability(string fname, string lname);
    [OperationContract]
    string KFspCheckEventAccount(string epname, string euname);
    [OperationContract]
    string KFspCheckEventName(string ename);
    [OperationContract]
    string KFspCheckEventPerson(string efname, string elname);
    [OperationContract]
    void KFspCreateEvent(string efname, string elname, string epname, string ename, string euname);
    [OperationContract]
    void KFspFinalizeEvent(string eventid);
    [OperationContract]
    void KFspPopulateScores(string confname, string conlname, string judgefname, string judgelname, string judgeuname, string judgepass, int eventid, string critname);
    [OperationContract]
    void KFspRemoveContsestantFromEvent(string fname, string lname, string eventid);
    [OperationContract]
    void KFspUpdateContestant(string fname, string lname, int perid);
    [OperationContract]
    string KFspViewEventContestants(int eventid);
    [OperationContract]
    string KFspViewNotEventContestants(int eventid);
    [OperationContract]
    string MCspGetEventCriteriaID(string Name, int EventJudgeID);
    [OperationContract]
    void MCspUpdateScore(int EventJudgeID, int ContestantID, int EventCriteriaID, float Score);
    [OperationContract]
    string MCspViewContestant(int ContestantID);
    [OperationContract]
    string MCspViewContestants(string EventName);
    [OperationContract]
    string MCspViewContestantsEvent(int EventID);
    [OperationContract]
    string MCspViewCriteria(int EventJudgeID);
    [OperationContract]
    string MCspViewJudgeEvent(string EventName, int JID);
    [OperationContract]
    string MCspViewJudges(int JudgeID);
    [OperationContract]
    string MCspViewOfficialResults(int EventID);
    [OperationContract]
    string MCspViewScore(int EventJudgeID, int ContestantID, int EventCriteriaID);
    [OperationContract]
    string MCspViewScoreWeight(int ContestantID, int EventJudgeID);
    [OperationContract]
    string MCspViewStatus(string EventName, int JudgeID, int ContestantID);
    [OperationContract]
    void spAddCriteriaToEventCriteria(string cname, int weight, int eventid);
    [OperationContract]
    void spAddJudgeToEventJudges(string fname, string lname, string uname, string pass, int eventid);
    [OperationContract]
    void spAddOldCriteriaToEventCriteria(string cname, int weight, int eventid);
    [OperationContract]
    void spAddPersonToEventJudges(string fname, string lname, string uname, string pass, int eventid);
    [OperationContract]
    string spCheckCExistance(string cname, int eventid);
    [OperationContract]
    string spCheckcnameavailability(string cname);
    [OperationContract]
    string spCheckPersonExistanceinEvent(string fname, string lname, string uname, string pass, int eventid);
    [OperationContract]
    string spCheckUnameavailability(string judgechars);
    [OperationContract]
    void spRemoveCriteriaFromEventCriteria(string cname, int eventid);
    [OperationContract]
    void spRemoveJudgefromEventJudges(string fname, string lname, string uname, string pass);
    [OperationContract]
    void spUpdateEventCriteria(string cname, int weight, int eventid, int critid);
    [OperationContract]
    void spUpdatePersonJudgeDetails(int personid, string fname, string lname, string uname, string pass, int eventid);
    [OperationContract]
    string spViewEventCriteria(int eventid);
    [OperationContract]
    string spViewEventJudges(int eventid);
    [OperationContract]
    string spViewNotEventCriteria(int eventid);
    [OperationContract]
    string spViewNotEventJudges(int eventid);
}
