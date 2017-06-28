#include <XBotInterface/StateMachine.h>

#include <iostream>
#include <vector>

#include <ros/ros.h>

#include <ADVR_ROS/advr_segment_control.h>

#include <trajectory_utils/segment.h>
#include <trajectory_utils/Cartesian.h>

#include <eigen_conversions/eigen_msg.h>
#include <XBotCore-interfaces/XDomainCommunication.h>


namespace myfsm{

/*Example how to define a custom Event*/
/*  class MyEvent : public XBot::FSM::Event {

    public:

      MyEvent(int id): id(id) {}
      
      int id;    

    };
*/

/*Example how to define a custom Message*/   
/*  class MyMessage : public XBot::FSM::Message {

    public:
      
      MyMessage (int id):id(id){};
      
      int id;
	
    };
*/
    struct SharedData {
      
      XBot::RobotInterface::Ptr _robot;

      ros::ServiceClient _client;
      // geometry_msgs::PoseStamped::ConstPtr _lhand_pose;

      // input from keyboard
      XBot::SubscriberRT<XBot::Command> command;
      XBot::Command current_command;
     
    };
    
    class MacroState : public  XBot::FSM::State< MacroState , SharedData > {
      
    public:
	
	virtual void entry(const XBot::FSM::Message& msg) {};
	virtual void react(const XBot::FSM::Event& e){};
      
    };  

 
    class Start : public MacroState {

      virtual std::string get_name() const { return "Start"; }

      virtual void run(double time, double period);

      virtual void entry(const XBot::FSM::Message& msg);

      virtual void react(const XBot::FSM::Event& e);

      virtual void exit ();

      private:


     };
 
    class MoveHand : public MacroState {

      virtual std::string get_name() const { return "MoveHand"; }

      virtual void run(double time, double period);

      virtual void entry(const XBot::FSM::Message& msg);

      virtual void react(const XBot::FSM::Event& e);

      virtual void exit ();

      private:


     };
     
      
}
