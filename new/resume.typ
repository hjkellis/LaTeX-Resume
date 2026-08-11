#let normal = 9pt
#let large = normal * 1.1
#let gray = luma(70)
#let v_space = v(10pt)

#set page(
  paper: "a4",
  margin: (x: 0.3in, y: 0.4in),
)

#set text(
  font: "Nimbus Sans",
  size: normal,
)

#let section(title, body,
title_color: black, body_color: black) = {
  box()[
    #table(
      columns: (1fr, 6fr),
      column-gutter: 20pt,
      stroke: none,
      align: (top+right, bottom+left),
      [
        #set text(weight: "bold", size: large, fill: title_color)
        #title
      ],
      [
        #set text(weight: "regular", size: normal, fill: body_color)
        #body
      ],
    )
  ]
  v_space
}

#let experiences(..exp) = {
  exp.pos().map(e => e).join(v_space)
}

#let experience(position, company, time, location, ..desc) = {
  let desc_items = desc.pos().map(d => [- #d]).join()
  [
    #set text(weight: "bold", size: large)
    #position
    #set text(weight: "bold", fill: gray)
    -- #company \
    #set text(weight: "regular", size: normal, fill: gray)
    #time -- #location \
    #set text(weight: "regular", size: normal, fill: black)
    #desc_items
  ]
}

#let educations(..edus) = {
  let items = edus.pos()
  let cols = (1fr,) * items.len()
  align(top+left)[
    #table(
      columns: cols,
      stroke: none,
      align: top+left,
      inset: 0pt,
      column-gutter: 15pt, ..items
    )
  ]
}

#let education(school, degree, ..desc) = {
  let desc_items = desc.pos().map(d => [- #d]).join()
  [
    #set text(weight: "bold", fill: black)
    #school \
    #set text(weight: "regular", size: normal, fill: gray)
    #degree \
    #set text(weight: "light", size: normal, fill: black)
    #desc_items
  ]
}

#let projects(..exp) = {
  exp.pos().map(e => e).join(v_space)
}

#let project(position, tools, ..desc) = {
  let desc_items = desc.pos().map(d => [- #d]).join()
  [
    #set text(weight: "bold", size: large)
    #position
    #set text(weight: "light", size: normal, fill: gray)
    -- #tools
    #set text(weight: "regular", size: normal, fill: black)
    #desc_items
  ]
}

// Heading
#section([
  #set text(weight: "bold", size: normal*1.2, fill: black)
  Hunter Ellis
], [
  #set text(weight: "regular", size: large, fill: black)
  elliswhunter\@gmail.com #h(1fr) hjkellis.github.io #h(1fr) github.com/hjkellis #h(1fr) (703)-953-6963 ], title_color: black
)

#section([Synopsis],
  [
    #set text(weight: "regular", size: normal, fill: black)
    I am an Avionics Engineer with experience developing autonomy software for motion planning, estimation, and control systems.
  ]
)

// Experience
// Bullets should answer: What?, How?, Why?
#section([Experience], experiences(

  experience(
    [Avionics Research Engineer], [Georgia Tech Research Institute],
    [Aug 2025 to Present], [Atlanta, GA],
    [Developing C++ software for collaborative autonomous UAV swarms in a component-based software engineering environment.],
    [Created a containerized motion planning service with hybrid planning using graph, sampling, and optimization methods for use on fixed-wing UAVs.],
    [Benchmarked motion planning algorithms -- leveraged The Open Motion Planning Library (OMPL).],
    [Developed a multi-object tracking (MOT) algorithm for EO/IR sensors -- HITL tested and deployed it onto flight hardware.],
    [Designed and implemented a track-to-track fusion system for decentralized tracking systems.],
    // [Integrating, developing, and benchmarking sampling-based motion planning algorithms over constraint manifolds -- leveraging The Open Motion Planning Library (OMPL).],
    // [Integrated multi-hypothesis tracking (MHT) software, including prediction and data association algorithms for multi-object tracking (MOT) in decentralized swarms with distributed sensor data.],
    [Wrote state estimation algorithms for distributed multi-sensor tracking.],
    [Refactored legacy software to use Distributed Data Service (DDS) middleware.],
  ),

  experience(
    [Thrust Vector Control Intern], [Jacobs Space Exploration Group],
    [May 2024 to Aug 2024], [Huntsville, AL],
    [Developed hardware and software to test the thrust vector control system of NASA’s Mars Ascent Vehicle at the Marshall Space Flight Center.],
    [Identified and modeled electro-mechanical actuator dynamics for NASA's Active Inertial Load Simulator using Python, MATLAB, and LabVIEW -- designed tests to characterize actuator response.],
    [Integrated IIR filters to reduce high frequency noise from a load cell and LVDT.]
  ),

  experience(
    [Robotics Researcher / M.S. Thesis], [Virginia Tech],
    [Aug 2023 to May 2025], [Blacksburg, VA],
    [Built a 6-DOF robotic arm and an accompanying ROS2–Gazebo simulation environment for training, evaluating, and deploying custom control algorithms.],
    [Integrated object detection (YOLOv8), natural language processing, symbolic reasoning, and a DDPG-based reinforcement learning policy for robotic manipulation tasks.],
    [Aided professors in teaching fundamental concepts in linear systems theory and digital signal processing, including Laplace Transforms, Z-Transforms, system stability, and FIR & IIR filter design.],
    [Assisted with hands-on projects to illustrate and integrate analog and digital filter design and application on breadboards and TI-MSP432 development boards.]
  ),

  experience(
    [Control Research Intern], [Grenoble Electrical Engineering Lab], [Jun 2023 to Aug 2023], [Grenoble, FR],
    [Implemented inverter control methods for 4-leg (microgrid) topologies and tested them in Simulink and HITL.],
    [Simulated neutral point capacitive and balancing topologies using 4-leg inverters in Simulink. Tested PI control, PR control, Clarke and Park Transforms with HITL simulations.]
  ),

  experience(
    [Engineering Intern (NREIP)], [Naval Surface Warfare Center],
    [Jun 2022 to Aug 2022], [Bethesda, MD],
    [Developed concept hospital sea-train designs, estimated fuel consumption, and electrical power loads.]
  )
))

// Education
#section([Education], educations(

  // education(
  //   [M.S. Aerospace Engineering],
  //   [Georgia Tech],
  //   [Focus: Flight Mechanics and Control]
  // ),

  education(
    [M.S. Computer Engineering],
    [Virginia Tech -- 2025],
    [Focus: Signals and Systems],
    [Research Group: COOL Autonomy Lab \@ UT Austin]
  ),

  education(
    [B.S. Computer Engineering\
     B.S. Electrical Engineering],
    [Virginia Tech -- 2024],
    [Focus: Controls, Robotics, and Autonomy]
  )

))

// Tools
#section(
  [Tools/Libs],
  [
    #set text(weight: "regular", size: normal, fill: black)
    ROS2, OMPL, DDS, GNU/Linux, Git, Qt, Simulink, Docker, FreeRTOS, SOLIDWORKS, Autodesk Inventor
  ]
)

// #section(
//   [Projects],
//   projects(
//     // project(
//     //   [FPV Wingman],
//     //   [ROS2, OMPL, Nav2, C++, Python],
//     //   [3D printed robot arm, built using stepper motors and pulleys],
//     //   [Implemented ROS2 Jazzy control and Gazebo Harmonic simulation]
//     // ),
//     project(
//       [Robotic Arm],
//       [ROS2, OMPL, C++, Python],
//       [3D printed robot arm, built using stepper motors and pulleys],
//       [Implemented ROS2 Jazzy control and Gazebo Harmonic simulation]
//     )
//   )
// )
