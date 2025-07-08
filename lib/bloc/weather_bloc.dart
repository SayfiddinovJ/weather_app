import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/data/models/country/country_model.dart';
import 'package:weather_app/data/models/country/region_model.dart';
import 'package:weather_app/data/models/weather/condition_model.dart';
import 'package:weather_app/data/models/weather/current_model.dart';
import 'package:weather_app/data/models/weather/location_model.dart';
import 'package:weather_app/data/models/weather/weather_model.dart';
import 'package:weather_app/data/status.dart';
import 'package:weather_app/data/storage/storage_repo.dart';
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
              lastUpdatedEpoch: 0,
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
              windchillC: 0,
              windchillF: 0,
              heatIndexC: 0,
              heatIndexF: 0,
              dewPointC: 0,
              dewPointF: 0,
              visKm: 0,
              visMiles: 0,
              uv: 0,
              gustMph: 0,
              gustKph: 0,
            ),
            forecastModel: [],
          ),
          countryModel: CountryModel(
            countryName: '',
            countryShortCode: '',
            regions: [],
          ),
          cityName: '',
          countries: [],
          selectedCountry: CountryModel(
            countryName: '',
            countryShortCode: '',
            regions: [],
          ),
          selectedRegion: RegionModel(name: '', shortCode: ''),
          storageList: [],
        ),
      ) {
    on<WeatherEvent>((event, emit) {});
    on<GetWeatherEvent>(getCurrentWeather);
    on<GetCountriesFromStorageEvent>(getCountriesFromStorage);
    on<GetCountriesFromJsonEvent>(getCountriesFromJson);
    on<AddRegionToStorageEvent>(addRegionToStorage);
  }

  Future<void> getCurrentWeather(
    GetWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    String cityName = StorageRepository.getString('cityName');
    UniversalData data = await weatherRepository.getWeather(cityName);
    if (data.error.isEmpty) {
      emit(state.copyWith(status: Status.success, weather: data.data!));
    } else {
      emit(state.copyWith(status: Status.error, error: data.error));
    }
  }

  Future<void> getCountriesFromStorage(
    GetCountriesFromStorageEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    UniversalData data = await weatherRepository.getCountriesFromStorage();
    if (data.error.isEmpty) {
      emit(state.copyWith(status: Status.success, storageList: data.data!));
    } else {
      emit(state.copyWith(status: Status.error, error: data.error));
    }
  }

  Future<void> getCountriesFromJson(
    GetCountriesFromJsonEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    UniversalData data = await weatherRepository.getCountriesFromJson();
    if (data.error.isEmpty) {
      emit(state.copyWith(status: Status.success, countries: data.data!));
    } else {
      emit(state.copyWith(status: Status.error, error: data.error));
    }
  }

  Future<void> addRegionToStorage(
    AddRegionToStorageEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    UniversalData data = await weatherRepository.addRegionToStorage(
      event.storageModel,
    );
    if (data.error.isEmpty) {
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.error, error: data.error));
    }
  }

  Future<void> selectCountry(
    SelectCountryEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(selectedCountry: event.country));
  }
}
