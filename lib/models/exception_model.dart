class ExceptionModel implements Exception  
{
  final String message;
  ExceptionModel(this.message );

  @override
  String toString() => 'ExceptionModel: $message'; 
   
}
