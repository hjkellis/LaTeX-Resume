#let normal = 7pt
#let large = normal * 1.2
#let gray = luma(120)
#let v_space = v(15pt)

#set page(
  paper: "a4",
  margin: (x: 0.5in, y: 0.5in),
)

#set text(
  font: "juliamono",
  size: normal,
)

#let section(title, body,
title_color: gray, body_color: black) = {
  box()[
    #table(
      columns: (1fr, 6fr),
      column-gutter: 25pt,
      stroke: none,
      align: (top+right, bottom+left),
      [
        #set text(weight: "bold", size: large, fill: title_color)
        #title
      ],
      [
        #set text(weight: "regular", size: 8pt, fill: body_color)
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
    #set text(weight: "bold", size: normal, fill: gray)
    #degree \
    #set text(weight: "light", size: normal, fill: black)
    #desc_items
  ]
}

// Heading
#section([Hunter Ellis], [elliswhunter\@gmail.com #h(1fr) hjkellis.github.io #h(1fr) github.com/hjkellis #h(1fr) (703)-953-6963], title_color: black)

#section([Synopsis], [I am an Autonomy Engineer with experience developing software for motion planning, estimation, and control systems.])
// I have degrees in Electrical (B.S.) and Computer (M.S.) Engineering, and I am currently enrolled as an Aerospace (M.S.) Student at Georgia Tech.])

// Experience
#section([Experience], experiences(

  experience(
    [Avionics Engineer], [Georgia Tech Research Institute],
    [Aug 2025 to Present], [Atlanta, GA],
    [Developing C++ software for collaborative autonomous UAV swarms in a component-based software engineering environment.],
    [Developed a containerized motion planning service with hybrid planning using graph, sampling, and optimization methods.],
    [Integrating, developing, and benchmarking sampling-based motion planning algorithms over constraint manifolds -- leveraging The Open Motion Planning Library (OMPL).],
    // [Integrated multi-hypothesis tracking (MHT) software, including prediction and data association algorithms for multi-object tracking (MOT) in decentralized swarms with distributed sensor data.],
    [Created a world model service for a collaborative-decentralized swarm.],
    [Wrote data association algorithms for multi-object tracking (MOT) and vehicle-to-vehicle track consensus.],
    [Software systems integration],
  ),

  experience(
    [Robotics Researcher / M.S. Thesis], [Virginia Tech],
    [Aug 2023 to May 2025], [Blacksburg, VA],
    [Built a 6-DOF robotic arm and an accompanying ROS2–Gazebo simulation environment for training, evaluating, and deploying custom control algorithms.],
    [Integrated object detection (YOLOv8), natural language processing, symbolic reasoning, and a DDPG-based reinforcement learning policy for robotic manipulation tasks.],
    [Aided professors in teaching fundamental concepts in linear systems theory and digital signal processing, including Laplace Transforms, Z-Transforms, system stability, and FIR & IIR filter design.],
            [Assisted with hands-on projects to illustrate and integrate analog and digital filter design and application on breadboards and TI MSP432 development boards.]
  ),

  experience(
    [Thrust Vector Control Intern], [Jacobs Space Exploration Group],
    [May 2024 to Aug 2024], [Huntsville, AL],
    [Developed thrust vector control testing hardware and software for NASA's Active Inertial Load Simulator at the Marshall Space Flight Center.],
    [Created and ran tests to develop a mathematical model of an electro-mechanical actuator -- used Python, MATLAB, and LabVIEW.]
  ),

  experience(
    [Control Research Intern], [Grenoble Electrical Engineering Lab], [Jun 2023 to Aug 2023], [Grenoble, FR],
    [Implemented inverter control methods for 4-leg (microgrid) topologies and tested them in Simulink and HIL.]
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
  //   [Georgia Tech],
  //   [M.S. Aerospace Engineering],
  //   [Focus: Flight Mechanics and Control]
  // ),
  //
  // education(
  //   [Virginia Tech],
  //   [M.S. Computer Engineering \
  //    B.S. Electrical Engineering \
  //    B.S. Computer Engineering],
  // )

  education(
    [M.S. Computer Engineering],
    [Virginia Tech #h(12em) May 2025],
    [Focus: Software and Machine Intelligence],
    [Research Group: COOL Autonomy Lab \@ UT Austin]
  ),

  education(
    [B.S. Computer Engineering \
     B.S. Electrical Engineering],
    [Virginia Tech #h(12em) May 2024],
    [Focus: Controls, Robotics, and Autonomy]
  )

))

// Tools
#section(
  [Tools/Libs],
  [ROS2, OMPL, DDS, GNU/Linux, Git, Qt, Simulink, Docker, FreeRTOS, SOLIDWORKS, Autodesk Inventor]
)

