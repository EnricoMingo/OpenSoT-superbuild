#include "fsm_definition.h"
#include <string>
#include <iostream>

int i=0;
bool first = false;
int mult = 1; // multiplier to get pose in respect to the hand
// char hand_frame[10] = "LSoftHand";
std::string hand_frame; // initialize hand_frame
std::string elbow_frame; // initialize elbow frame

 /*BEGIN Start*/

void myfsm::Start::react(const XBot::FSM::Event& e) {

	// std::cout << "react start" << std::endl;
}

void myfsm::Start::entry(const XBot::FSM::Message& msg){

	// std::cout << "entry start" << std::endl;
}


void myfsm::Start::run(double time, double period){

	// std::cout << "run start" << std::endl;

	// shared_data()._lhand_pose =
 	// ros::topic::waitForMessage<geometry_msgs::PoseStamped>("_lhand_pose");
    // Debug msg
  	// std::cout << shared_data()._lhand_pose->pose.position.y << std::endl;

    if (!first){ // initialize hand_frame
        // blocking reading: wait for a command
        if(shared_data().command.read(shared_data().current_command))
        {
            // std::cout << "Command: " << shared_data().current_command.str() << std::endl;

            // chech input for right arm
            if (!shared_data().current_command.str().compare("right")) {
                hand_frame = "RSoftHand";
                elbow_frame = "RElb";
                first = true;
                mult = -1;
                i++; // counter for movements
                transit("MoveHand");
            }

            // chech input for left arm
            if (!shared_data().current_command.str().compare("left")) {
                hand_frame = "LSoftHand";
                elbow_frame = "LElb";
                first = true;
                mult = 1;
                i++; // counter for movements
                transit("MoveHand");
            }

        } // end if: input
    }
    else {
        i++; // counter for movements
        transit("MoveHand");
    } // end if : initialize hand
}

void myfsm::Start::exit (){

	// std::cout << "exit start" << std::endl;
}

/*END Start*/


 /*BEGIN MoveHand*/

void myfsm::MoveHand::react(const XBot::FSM::Event& e) {

	// std::cout << "react move hand" << std::endl;
}

void myfsm::MoveHand::entry(const XBot::FSM::Message& msg){

	// std::cout << "entry move hand" << std::endl;
    std::cout << "Iteration: " << i << std::endl;
    std::cout << "Hand Frame: " << hand_frame.data() << std::endl;

	// sense and sync model
    shared_data()._robot->sense();
    
    // Get current hand pose
    Eigen::Affine3d pose;
    geometry_msgs::Pose start_frame_pose_hand;
    // geometry_msgs::Pose start_frame_pose_elbow;
    shared_data()._robot->model().getPose(hand_frame.data(), pose);
    // shared_data()._robot->model().getPose(elbow_frame.data(), pose);
    
    // from eigen to ROS pose
    tf::poseEigenToMsg (pose, start_frame_pose_hand);
    // tf::poseEigenToMsg (pose, start_frame_pose_elbow);

    // define the PoseStamped start_frame amd end_frame
    geometry_msgs::PoseStamped start_frame_hand;
    // geometry_msgs::PoseStamped start_frame_elbow;
    start_frame_hand.pose = start_frame_pose_hand;
    // start_frame_elbow.pose = start_frame_pose_elbow;
    
    geometry_msgs::PoseStamped end_frame_hand;
    // geometry_msgs::PoseStamped end_frame_elbow;
    end_frame_hand.pose = start_frame_pose_hand;
    // end_frame_elbow.pose = start_frame_pose_elbow;

    trajectory_utils::Cartesian start_hand;
    trajectory_utils::Cartesian end_hand;
    // trajectory_utils::Cartesian start_elbow;
    // trajectory_utils::Cartesian end_elbow;

    start_hand.distal_frame = hand_frame.data();
    start_hand.frame = start_frame_hand;
    // start_elbow.distal_frame = elbow_frame.data();
    // start_elbow.frame = start_frame_elbow;
    
    switch(i) { // position representation: (x, y, z)

		case 1: // (0.0, 0.3, 0.3)
        end_frame_hand.pose.position.x += 0.0;
		end_frame_hand.pose.position.y += 0.3 * mult;
   		end_frame_hand.pose.position.z += 0.3; 
		break;

		case 2: // (0.1, 0.2, 0.2)
        end_frame_hand.pose.position.x += 0.1;
        end_frame_hand.pose.position.y -= 0.1 * mult;
        end_frame_hand.pose.position.z -= 0.1;
		break;

		case 3: // (0.5, 0.2, 0.1)
        end_frame_hand.pose.position.x += 0.4;
        end_frame_hand.pose.position.y -= 0.0 * mult;
        end_frame_hand.pose.position.z -= 0.1;
		break;

        case 4: // (0.45, 0.1, 0.2)
        end_frame_hand.pose.position.x -= 0.15;
        end_frame_hand.pose.position.y -= 0.1 * mult;
        end_frame_hand.pose.position.z += 0.1;
        break;

        case 5: // (0.2, 0.1, 0.05)
        end_frame_hand.pose.position.x -= 0.25; 
        end_frame_hand.pose.position.y -= 0.0 * mult;
        end_frame_hand.pose.position.z -= 0.15;
        break;

        case 6: // (0.2, 0.3, 0.3)
        end_frame_hand.pose.position.x -= 0.0;
        end_frame_hand.pose.position.y += 0.2 * mult;
        end_frame_hand.pose.position.z += 0.25;
        break;

        case 7: // (0.2 , 0.1, 0.0)
        end_frame_hand.pose.position.x -= 0.0;
        end_frame_hand.pose.position.y -= 0.2 * mult;
        end_frame_hand.pose.position.z -= 0.3;
        break;

        case 8: // (0.3 , 0.1, 0.0)
        end_frame_hand.pose.position.x += 0.1;
        end_frame_hand.pose.position.y -= 0.0 * mult;
        end_frame_hand.pose.position.z += 0.0;
        break;

        case 9: // (0.0, 0.0, 0.0)
        end_frame_hand.pose.position.x -= 0.3; // homing
        end_frame_hand.pose.position.y -= 0.1 * mult;
        end_frame_hand.pose.position.z -= 0.0;
        break;

        // orientation in z-axis
        case 10: // (0.0, 0.3, 0.3)
        // std::cout << "Starting orientation" << std::endl;
        end_frame_hand.pose.position.x += 0.0;
        end_frame_hand.pose.position.y += 0.3 * mult;
        end_frame_hand.pose.position.z += 0.3;

        end_frame_hand.pose.orientation.z -= 0.5 * mult; // orientation
        break;

        case 11: // (0.1, 0.2, 0.2)
        end_frame_hand.pose.position.x += 0.1;
        end_frame_hand.pose.position.y -= 0.1 * mult;
        end_frame_hand.pose.position.z -= 0.1;
        break;

        case 12: // (0.5, 0.2, 0.1)
        end_frame_hand.pose.position.x += 0.4;
        end_frame_hand.pose.position.y -= 0.0 * mult;
        end_frame_hand.pose.position.z -= 0.1;
        break;

        case 13: // (0.45, 0.1, 0.2)
        end_frame_hand.pose.position.x -= 0.15;
        end_frame_hand.pose.position.y -= 0.1 * mult;
        end_frame_hand.pose.position.z += 0.1;
        break;

        case 14: // (0.2, 0.1, 0.05)
        end_frame_hand.pose.position.x -= 0.25; 
        end_frame_hand.pose.position.y -= 0.0 * mult;
        end_frame_hand.pose.position.z -= 0.15;
        break;

        case 15: // (0.2, 0.3, 0.3)
        end_frame_hand.pose.position.x -= 0.0;
        end_frame_hand.pose.position.y += 0.2 * mult;
        end_frame_hand.pose.position.z += 0.25;
        break;

        case 16: // (0.2 , 0.1, 0.0)
        end_frame_hand.pose.position.x -= 0.0;
        end_frame_hand.pose.position.y -= 0.2 * mult;
        end_frame_hand.pose.position.z -= 0.3;
        break;

        case 17: // (0.3 , 0.1, 0.0)
        end_frame_hand.pose.position.x += 0.1;
        end_frame_hand.pose.position.y -= 0.0 * mult;
        end_frame_hand.pose.position.z += 0.0;
        break;

        default: // (0.0, 0.0, 0.0)
        end_frame_hand.pose.position.x -= 0.3; // homing
        end_frame_hand.pose.position.y -= 0.1 * mult;
        end_frame_hand.pose.position.z -= 0.0;

        end_frame_hand.pose.orientation.z += 0.5 * mult; // re-orientate

        first = false;
		i=0;
        std::cout << std::endl << "\t Please set which hand to move !" << std::endl;
		break;

	} // end switch


    end_hand.distal_frame = hand_frame.data();
    end_hand.frame = end_frame_hand;
    // end_elbow.distal_frame = elbow_frame.data();
    // end_elbow.frame = end_frame_elbow;

	// define the first segment
    trajectory_utils::segment s1;
    s1.type.data = 0;        // min jerk traj
    s1.T.data = 5.0;         // traj duration 5 second      
    s1.start = start_hand;        // start pose
    s1.end = end_hand;            // end pose 

    // trajectory_utils::segment s2;
    // s2.type.data = 0;        // min jerk traj
    // s2.T.data = 5.0;         // traj duration 5 second      
    // s2.start = start_elbow;        // start pose
    // s2.end = end_elbow;            // end pose 

	// only one segment in this example
    std::vector<trajectory_utils::segment> segments;
    segments.push_back(s1);
    // segments.push_back(s2);
    
    // prapere the advr_segment_control
    ADVR_ROS::advr_segment_control srv;
    srv.request.segment_trj.header.frame_id = "world";
    srv.request.segment_trj.header.stamp = ros::Time::now();
    srv.request.segment_trj.segments = segments;

    // call the service
    shared_data()._client.call(srv);

}


void myfsm::MoveHand::run(double time, double period){

	// std::cout << "run move hand" << std::endl;

	// blocking reading: wait for a command
  	if(shared_data().command.read(shared_data().current_command))
  	{
    	// std::cout << "Command: " << shared_data().current_command.str() << std::endl;

    	// chech input
    	if (!shared_data().current_command.str().compare("next")) {
    		transit("Start");
    	}

  	} // end if

	// transit("Start");
} // end run

void myfsm::MoveHand::exit (){

	// std::cout << "exit move hand" << std::endl;
}

/*END MoveHand*/



