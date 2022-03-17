import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/data/models/cinema_location.dart';
import 'package:flutter_movie_app/src/core/data/models/movie_date.dart';
import 'package:flutter_movie_app/src/core/data/models/seat.dart';
import 'package:flutter_movie_app/src/core/data/models/seat_label.dart';
import 'package:flutter_movie_app/src/core/data/models/section_seat.dart';

import 'category.dart';
import 'movie.dart';

final movieDates = MovieDate('Mar', 1,
    ['09:00', '10:30', '11:30', '13:00', '15:00', '17:30', '18:30', '20:30']);

final seatLabels = [
  SeatLabel('Available', Colors.grey),
  SeatLabel('Selected', AppColors.principalColor),
  SeatLabel('Reserved', Colors.white),
];

final cinemaLocation = [
  Location(
    name: "Cinema A1",
    ailes: 9,
    sections: [
      SeatSection(
        seats: List.generate(
          24,
          (index) => Seat(
            isBusy: [3, 9, 10, 17, 18].contains(index),
            isHidden: [0, 20].contains(index),
          ),
        ),
      ),
      SeatSection(
        seats: List.generate(
          24,
          (index) => Seat(
            isBusy: [6, 17, 18, 19, 20].contains(index),
            isHidden: [3, 23].contains(index),
          ),
        ),
      ),
    ],
  )
];

final categories = [
  Category(
    name: "Romance",
    icon: "😍",
  ),
  Category(
    name: "Comedy",
    icon: "😁",
  ),
  Category(
    name: "Horror",
    icon: "😱",
  ),
  Category(
    name: "Drama",
    icon: "😗",
  ),
  Category(
    name: "Suspenso",
    icon: "😑",
  ),
  Category(
    name: "Historia",
    icon: "🤓",
  ),
];

final movies = [
  Movie(
    dates: movieDates,
    location: cinemaLocation[0],
    name: "Harry Potter y la piedra filosofal",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp1.jpg",
    raiting: 8.7,
    synopsis:
        "Un día cerca del undécimo cumpleaños de Harry Potter, un chico huérfano, comienza a percibir extraños acontecimientos a su alrededor, los cuales alcanzan su punto máximo cuando unas cartas enviadas desde el Colegio Hogwarts de Magia y Hechicería llegan a la casa donde vive con sus tíos. Las cartas destapa los secretos que sus tíos le escondieron durante toda su vida: sus padres fueron magos y un mago tenebroso –lord Voldemort– los asesinó en una época de guerra encarnizada, por lo que Harry es un mago de la misma manera y deberá comenzar sus estudios como tal en esa escuela. Para este fin, Dumbledore, le muestra la fortuna monetaria que le dejaron sus padres. Escoltado por el guardabosques del colegio, Rubeus Hagrid, Harry parte rumbo al colegio de magos donde se esconde un antiguo objeto legendario, la piedra filosofal. Al lado de los que se volverían sus mejores amigos, Ron Weasley y Hermione Granger, Harry intenta convencer a sus profesores de que la piedra puede ser robada por el profesor Severus Snape, lo cual es negado por los últimos pues afirman que se encuentra en un lugar seguro y protegido. Durante las aventuras, el protagonista averigua más sobre su verdadero pasado.",
  ),
  Movie(
    dates: movieDates,
    location: cinemaLocation[0],
    name: "Harry Potter y la cámara secreta",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp2.jpg",
    raiting: 9.7,
    synopsis:
        "Un elfo doméstico se presenta en la casa de los tíos de Harry antes de comenzar su segundo año en la escuela; la criatura le advierte que no regrese al colegio ya que hay un complot para causar caos y muertes donde Harry se verá involucrado.La Cámara Secreta es abierta y tras ello varios alumnos sufren atentados sin que el responsable de dichos ataques pueda ser identificado, pero los docentes saben que la situación no es nueva y que está relacionada con la leyenda fundacional del mismo instituto. Harry, junto a sus amigos Hermione y Ron, se enfrenta a un misterio que pone en peligro la continuidad del instituto Hogwarts –un hecho similar que había sucedido 50 años atrás– y descubre más sobre el pasado de lord Voldemort gracias a su diario personal.",
  ),
  Movie(
    dates: movieDates,
    location: cinemaLocation[0],
    name: "Harry Potter y el prisionero de Azkaban",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp3.jpg",
    raiting: 7.7,
    synopsis:
        "Poco antes de iniciar el tercer año del protagonista en el Colegio Hogwarts, un peligroso y supuesto homicida –Sirius Black– se fuga de la cárcel de Azkaban dejando preocupado al Ministerio de Magia y a la comunidad mágica, pues es el primero que lo logra. Arthur Weasley le advierte a Harry que el prófugo fue un seguidor de Voldemort durante el auge de su poder y que posiblemente se ha escapado para encontrar al causante del eclipse de su maestro, es decir, Harry.Como medida de seguridad, las autoridades del mundo mágico ordenan a los dementores –centinelas de la prisión de Azkaban que te quitan tus recuerdos felices– que vigilen los alrededores del colegio. Sin embargo, gracias a que Harry ha vivido momentos difíciles estos se irán contra Harry, por lo que Black usará sus habilidades animágicas, para lograr penetrar las defensas e introducirse en la escuela, por lo que su encuentro con Harry se hace inevitable. Durante su encuentro, figuran Remus Lupin, Severus Snape y Peter Pettigrew como parte crucial del pasado de los padres de Harry. En su encuentro Harry se encontrará con el horrible pasado de sus padres.",
  ),
  Movie(
    dates: movieDates,
    location: cinemaLocation[0],
    name: "Harry Potter y el cáliz de fuego",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp4.jpg",
    raiting: 8.5,
    synopsis:
        "Durante el verano, el Campeonato Mundial de Quidditch es interrumpido cuando los mortífagos, antiguos seguidores de lord Voldemort, atacan la sede del torneo. Este incidente señala que el poder de Voldemort no se ha extinguido totalmente y, sumado a las pesadillas de Harry, parecen presagiar que su regreso es inminente.Hogwarts se convierte en la sede del Torneo de los Tres Magos, una competencia en la que se enfrentan tres escuelas de magia europeas (Beauxbatons, Durmstrang y Hogwarts) y en la que un representante de cada escuela deberá completar tres pruebas durante todo el año. Sin embargo, el torneo es saboteado por Barty Crouch Jr. y Harry termina inmerso en la contienda aun cuando las reglas establecen que carece de la edad suficiente (17 años) y lo tradicional es que participen solo tres magos. La última prueba termina como trampa para permitir el resurgimiento de lord Voldemort y, consecuentemente, para que Harry se enfrente con él y muera el otro participante de Hogwarts.",
  ),
  Movie(
    dates: movieDates,
    location: cinemaLocation[0],
    name: "Harry Potter y la Orden del Fénix",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp5.jpg",
    raiting: 6.7,
    synopsis:
        "l Ministerio de Magia rehúsa creer que Voldemort ha reaparecido, pues teme esa situación y emprende una campaña de desprestigio contra Albus Dumbledore, Harry y todos los que sostienen lo contrario a la verdad oficial. Por lo que Albus Dumbledore crea la Orden del Fénix tomando medidas protectoras contra lord Voldemort y tratando de convencer a Cornelius Fudge para que acepte verdad de que lord Voldemort ha vuelto.Aparece por primera vez Luna Lovegood, una excéntrica estudiante. El ministro designa a Dolores Umbridge, una trabajadora del Ministerio, como inspectora y nueva profesora para que intervenga en Hogwarts y evite cualquier pensamiento subversivo respecto de no aceptar la versión del Ministerio sobre el tema Voldemort.",
  ),
  Movie(
    dates: movieDates,
    location: cinemaLocation[0],
    name: "Harry Potter y el misterio del príncipe",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp6.jpg",
    raiting: 9.7,
    synopsis:
        "En medio de los desastres que azotan a Inglaterra por ataques de Voldemort y sus mortífagos hacia muggles, Harry y sus compañeros vuelven a Hogwarts para cursar su sexto año de estudios. Se le asigna a Draco Malfoy una misión por parte de Voldemort y Snape jura protegerlo y realizar la misión del chico si este es incapaz de realizarla.A pesar de las medidas de seguridad que han convertido al colegio en una fortaleza para evitar cualquier entrometimiento de fuerzas malignas, algunos estudiantes son víctimas de ataques inexplicables. Asimismo, Harry encuentra un libro de pociones cuyo propietario es el «príncipe mestizo», que lo ayuda durante todo el año. Dumbledore y el protagonista exploran el pasado de lord Voldemort mediante recuerdos que el director ha recolectado pues desea preparar al muchacho para la batalla final. Gracias a una memoria de Horace Slughorn, a Dumbledore y Harry se les revela que Voldemort dividió su alma en siete objetos llamados «horrocruxes» con el objetivo de esquivar a la muerte. Después de una intensa búsqueda de alguno de estos últimos, Dumbledore es asesinado por Snape, poniendo en duda la verdadera lealtad del asesino y entregando el poder máximo a manos de Voldemort para su segundo intento de dominio del mundo mágico. Snape le cuenta a Harry que el es el Príncipe Mestizo.",
  ),
  Movie(
    dates: movieDates,
    location: cinemaLocation[0],
    name: "Harry Potter y las reliquias de la Muerte: parte 1",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp7.jpg",
    raiting: 9.7,
    synopsis:
        "Harry Potter, Hermione Granger y Ron Weasley se ven obligados a realizar un peligroso viaje lejos de los terrenos de Hogwarts, que los llevará alrededor del país en busca de los restantes horrocruxes, objetos siniestros que contienen fragmentos del alma de lord Voldemort. Se supone que este sería su último año en Hogwarts, pero el colapso del Ministerio de Magia y el reciente ascenso de Voldemort al poder les impide asistir.",
  ),
  Movie(
    dates: movieDates,
    location: cinemaLocation[0],
    name: "Harry Potter y las reliquias de la Muerte: parte 2",
    duractionMinutes: '1h 30m',
    gender: "Fiction",
    picture: "hp8.jpg",
    raiting: 9.7,
    synopsis:
        "Tras varios meses en busca de Horrocruxes y escondiéndose de los mortífagos por Inglaterra, Harry, Ron y Hermione regresan al Colegio Hogwarts al descubrir la existencia de otra parte del alma de Voldemort, allí Harry descubre que todo lo sucedido desde que fue entregado a sus tíos Dursley fue nada menos que un plan de Albus Dumbledore en donde cuidaba a Harry para su inminente final pensado y que la muerte de Albus Dumbledore fue planeado por el mismo Dumbledore y la verdadera rivalidad entre el padre de Harry (James Potter) y Severus Snape, pero en medio de su búsqueda de horrocruxes se desata la batalla final.",
  )
];
