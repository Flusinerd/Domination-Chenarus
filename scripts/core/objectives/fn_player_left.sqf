/**
 * Function that is called, when all players left a town trigger;
 * Author: Flusinerd(Jan)
 * params: [_trigger, _triggerList, _marker];
 */
 _marker = (_this select 2);
 _i = 0;
 {
     if ((_x == _marker)) then  {
         activeSectors deleteAt _i;
     };
     _i = _i + 1;
     
 } forEach activeSectors;
  hint ("Players left marker: " + _marker);
 _marker setMarkerAlpha 0.5;