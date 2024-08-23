import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/constants/color_constants.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_state.dart';
import 'package:movie/features/movies/presentation/widgets/movie_card/movie_card.dart';
import 'package:shimmer/shimmer.dart';

class UpComingMovies extends StatelessWidget {
  const UpComingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpComingMoviesBloc,UpcomingMoviesState>(
      builder:(context, state) {
         if(state is UpcomingMoviesLoadingState){
            return Shimmer.fromColors(
              baseColor: ColorConstants.imageBackgroundColor,
              highlightColor: Colors.grey,
              child: const MovieCard(
                moviesResultEntities: null,
              ));
         }
        if(state is UpcomingMoviesLoadedState){
          return MovieCard(moviesResultEntities: state.moviesResultEntities,);
         }
         if(state is UpcomingMoviesErrorState){
          return Center(child: Text(state.error,style:const TextStyle(color: Colors.white),),);
         }
         return Container();
      }, 
    );
  }

}