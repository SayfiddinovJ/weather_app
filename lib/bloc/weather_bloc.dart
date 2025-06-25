import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data/models/condition_model.dart';
import 'package:weather_app/data/models/current_model.dart';
import 'package:weather_app/data/models/location_model.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/status.dart';
import 'package:weather_app/data/universal_data.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository)
    : super(
        WeatherState(
          status: Status.pure,
          error: '',
          weather: WeatherModel(
            locationModel: LocationModel(
              name: '',
              region: '',
              country: '',
              lat: 0,
              lon: 0,
              tzId: '',
              localtimeEpoch: 0,
              localtime: '',
            ),
            currentModel: CurrentModel(
              lastUpdatedEpoch: '',
              lastUpdated: '',
              tempC: 0,
              tempF: 0,
              isDay: 0,
              condition: ConditionModel(text: '', icon: '', code: 0),
              windMph: 0,
              windKph: 0,
              windDegree: 0,
              windDir: '',
              pressureMb: 0,
              pressureIn: 0,
              preCipMm: 0,
              preCipIn: 0,
              humidity: 0,
              cloud: 0,
              feelsLikeC: 0,
              feelsLikeF: 0,
              visKm: 0,
              visMiles: 0,
              uv: 0,
              gustMph: 0,
              gustKph: 0,
            ),
          ),
        ),
      ) {
    on<WeatherEvent>((event, emit) {});
  }

  Future<void> getCurrentWeather(
    GetWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    UniversalData data = await weatherRepository.getWeather(event.cityName);
    if (data.error.isEmpty) {
      emit(state.copyWith(status: Status.success, weather: data.data!));
    } else {
      emit(state.copyWith(status: Status.error, error: data.error));
    }
  }
}
