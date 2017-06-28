/*
 * Copyright (C) 2017 IIT-ADVR
 * Author: Alexia Toumpa
 * email: alexia.toumpa@iit.it
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>
*/

#include <Head2Hand_Calib_plugin.h>
 #include <eigen_conversions/eigen_msg.h>

/* Specify that the class XBotPlugin::Head2Hand_Calib is a XBot RT plugin with name "Head2Hand_Calib" */
REGISTER_XBOT_PLUGIN(Head2Hand_Calib, XBotPlugin::Head2Hand_Calib)

namespace XBotPlugin {

bool Head2Hand_Calib::init_control_plugin(std::string path_to_config_file,
                                                    XBot::SharedMemory::Ptr shared_memory,
                                                    XBot::RobotInterface::Ptr robot)
{
    /* This function is called outside the real time loop, so we can
     * allocate memory on the heap, print stuff, ...
     * The RT plugin will be executed only if this init function returns true. */


    /* Save robot to a private member. */
    _robot = robot;

    fsm.shared_data().command = command;
    fsm.shared_data().current_command = current_command;

    /* Initialize a logger which saves to the specified file. Remember that
     * the current date/time is always appended to the provided filename,
     * so that logs do not overwrite each other. */
    
    _logger = XBot::MatLogger::getLogger("/tmp/Head2Hand_Calib_log");

    // ROS init
    int argc = 1;
    const char *arg = "dummy_arg";
    char* argg = const_cast<char*>(arg);
    char** argv = &argg;

    ros::init(argc, argv, "Head2Hand_Calib");

    // nh and service segment_control client
    _nh = std::make_shared<ros::NodeHandle>();
    fsm.shared_data()._client = _nh->serviceClient<ADVR_ROS::advr_segment_control>("segment_control");



    /*Saves robot as shared variable between states*/
    fsm.shared_data()._robot= robot;
    
    /*Registers states*/
    fsm.register_state(std::make_shared<myfsm::Start>());
    fsm.register_state(std::make_shared<myfsm::MoveHand>());
    
    // Initialize the FSM with the initial state
    fsm.init("Start");

    return true;


}

void Head2Hand_Calib::on_start(double time)
{
    /* This function is called on plugin start, i.e. when the start command
     * is sent over the plugin switch port (e.g. 'rosservice call /Head2Hand_Calib_switch true').
     * Since this function is called within the real-time loop, you should not perform
     * operations that are not rt-safe. */

    /* Save the plugin starting time to a class member */
    _robot->getMotorPosition(_q0);

    /* Save the robot starting config to a class member */
    _start_time = time;
}

void Head2Hand_Calib::on_stop(double time)
{
    /* This function is called on plugin stop, i.e. when the stop command
     * is sent over the plugin switch port (e.g. 'rosservice call /Head2Hand_Calib_switch false').
     * Since this function is called within the real-time loop, you should not perform
     * operations that are not rt-safe. */
}


void Head2Hand_Calib::control_loop(double time, double period)
{
    /* This function is called on every control loop from when the plugin is start until
     * it is stopped.
     * Since this function is called within the real-time loop, you should not perform
     * operations that are not rt-safe. */


    fsm.run(time, 0.01);

    // Spin ROS
    ros::spinOnce();

}

bool Head2Hand_Calib::close()
{
    /* This function is called exactly once, at the end of the experiment.
     * It can be used to do some clean-up, or to save logging data to disk. */

    /* Save logged data to disk */
    _logger->flush();

    return true;
}



}
