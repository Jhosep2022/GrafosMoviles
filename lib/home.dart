import 'dart:math';
import 'menu.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import '/figuras/figuras.dart';
import 'models/modelos.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700,
        centerTitle: true,
        title: Text('Grupo "Proyecto de instrumentalización humana"',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      drawer: MenuLateral(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t¡Análisis de Algoritmos!\nGrafos, Jhonson, Asignación y Norwest',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.network(
                'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgWFRYYGBgYGRgYGBocGBgYGhoYGBgZGRgYGhgcIS4lHCErHxgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhISGjQhISExNDE0NDQxNDQ0NDE0MTQ0NDQ0NDQ0MTQ0NDQ/Pz80PzE0NDQ0PzQ/Pz8xNDQxNDExMf/AABEIAMABBgMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAFAAECAwQGBwj/xAA8EAACAQIEAwUHAgQFBQEAAAABAgADEQQSITEFQVEGYXGBoRMiMlKRscFC0Qdy4fAUFSNiooKSsvHyM//EABkBAAMBAQEAAAAAAAAAAAAAAAABAgMEBf/EACIRAQEBAQACAwACAwEAAAAAAAABEQISIQMxQSJRMkJhE//aAAwDAQACEQMRAD8A8fAkTJRmMSjWiEe8UElGjxQBhHjCPAFFFFaAw8aORGMBhAxSJMV4A8k0gJKARikrRiIAWwy+4IOxK6wzST3B4QdXTMQNiTbXvkc326O+f4xdgOEl1zFsoPw6b25+Ex4vCtTbKw8OhHUTuxhFSyNplVV7tALyjjnBy1IkL7yjMum45iVrPx2OEIjR4o2ZXjGStImAIxRRQBR1MaTUQOJAXjP0Ec6eMiIKSEUjmjwI0TRRGBIx40eBEYpJUJiCGByGyx0Qk2EsWmZci2i1UhkwvWOFA5TSp0k8Bw96r5EFzzPIDqTFep+qnNv0GvqbDyhrhvZWvVAZgEU8238lGs7DgvZ+nR1sHfm5+yjlDqU5n18t/wBW3Pwz76cBxTscKdFnV2ZkGYggAFedud5yAWe1cQQeye/yMPqLfmeN5LaSvj6tntn8nHMvpVltFaScRpoyz2RpyS0ybCShHhmFzNmOw28YuusjTjjyuN6ocgFugksLwo51dtApB8xOx7PcAzJ7V9tSPAc4Jqn2lUgaJfQ7X3mfHP62+Xqf4xbw6ka1cZrkA5j00119IcxC2Hf6SnAJkIOXcWOvKFaVIOhYjlp1JmsjC3K8141wRc5ZNM1za2l+c57EYVk0M7vtCtlVhpZifLY+sEVUV01EVuC8zpyd4014zD5WtMwpkx6z8ajEBLRTitDTxDLJgRWjv0gcmGUXMc05GSD2gIiRFLAQYoHkVSSIWNhvGvLMM1mU98KhOjgmZgpIHrCA4cijW7H0lmEW7lumkurt7pgQJexkzUlRkC1oKldFwHgzYg5icqDQtzJ6L+86el2Xww3Dt4ufsJv4DhC2GpezUlSim4HPn63halwiqf0nzIH5nP1et9OnmcyewihwTDDRaKHxufuZvwfD1DMFULtooA08oUw3BHBvdfqT+IRpcLtuw8gfvDnm2+x13zJ6rDRwCje584Qo4RPkE1pgx8xPkJWPduCAbX6/ibzif05+u+r+s/GsIr4aoqqoOQkWAHw2b7AzwTi2FNOvUQ7o7D1uPQifQ+HUMhW5III1397SeA9r7ri6nfkJ8QqqftHmFOqDVBIiOzXjCB/q5YTwl9FTUkgWHfp94OBBnefw04JSdziKrr/ptZEv+v5j130EnrnWvHXjrueLp7DA/FksqqSN7HQgd5nCUxcBlKlP02PTqes7btlwipXXMj2CrpTOisb6knkbX5Tz2jhjQQKhLkG76WGu4F9TbrHmI3XS4DHKbZoUeoCDl0Ftd9hznK4KqC17DXY/edBhcUwGW1wdDHKVA8ZhnrsQqkL6W6QYOHOh97bWej0sOLbWEC9oKK2OU68toYUrzfiVPU8oJaFuLPY2gRmkrW3kQ0hmj3jwk22kB3xExWjIiRFeMRFeAw0UlFAYjHSPGEEOkRQFGXaZsdVsh79JPDvdF8BMfEX2HnAg43kZeFEpcQD2D+F2Mz4QpfWm7Dyb3h952ymeU/woxVqlWnf41Dgd6EAn6NPUgYHWhTJKZUskhlJxcrSmv8V+smJDEbCMLKJnhH8RMPkx9XTQkEeBnulIzz3t9wP21fMMoNubZd1TbzBk9L5m3HlFop1WF7HOzhXqIiWJzXDG41tYHx1nd8G7G4WmgzIKhI1Zhc6/aT5KnP8AbxsLOp7F4xKVce0AsfhPyt1nfY7+H+GcAoDT/l2+kCv/AA5dT7lUea62i1c5/wCvQqWKDp8Q2vA1ThiZjYC5mPh3AsTTXKK4tyutzt3wbxOljcOHqvWDqgJAC2vYXsRHsK8X8qdTsy4Y5CMhJIHMX3sYdwGCVFAOp74O4NxZ6qKWsDYE8txNtVwts7WJ2HU9ANzKkZ2tVTEBdiNYD4riEyNYgtM7VGxFRURlWnfVi9hn1sjWuVNxzgtOz+KKFn0dmIIJFsq6XX+bfwlWFoBj8rDUG/PbfppA+I4cwGYDSdzhuyLaZ29RaH24JTFPIbSLGnPt4uy2kZ0/HeCBHLKfdnN1EIMFWIRRRQSUUUUAUUUUAcxCK8aDMVwtW1O/S8GPULEk85MP7hHfeVoNYEcXiJluWRddIAc7DYv2eOom+jkofBxYeoE9xSfOODrZHRx+h1b/ALWB/E+jaD5lVhsQD9Rf8xwVcpkhIXkxKJIRqp084gYqnwmBaakZyva1f9S45Ih+pIP4nUAXtyseXPS1jAHbPClkupKlsq3FrizXvJ6+l87+OTVbwnw/i1SmMujryB0I8+kFJwzFfoYP/MhHqtpZVw2KS2egmugIcjXluJE9Ivx9/bpqfadQyBxkDaX3F/LlCD8bpXsHHrBHDey76vVYZyLZRqEX5R+TK8dgihsRccjaVMbc89Z7roaOMU/CwPhOc7Z8SIpMqAEkNvrsNgOusH4qsUX3DY8j/Sc52m4k5QKx1Y67chHeZ+D3ynhalanSFUFVol0zhahzKHsA+cg2XNcaDSdFwHgjYjNUqBkzE5GLl3KsNGRtMg35X1E4mlgqtekns0JVSwKKxAOuhsTa956j2Mwz0sMlOqbuAb63sP0rfnYaSpWdjXwTs5Rwy5UzO3NnNyfAbDWa8c4VSSZsBnN9qHcLdeW/SGiOf4nxJy2jEDxtBDcYYEqWuOZufpMeIZnOtx5TJWQKbWkLlxfi8fn0F7dYIxdGbBUibXSSuUAZbRhNeNpWMy2lA0Ue0VoEaKPaKAREe0TRGDI5EmiSKGTpwNOM40k7RP8ADAYzqlzYak6DxM967L1WfC0SRrkCt3Mvukek807OcDKqK1RfeI9xTyB/UR1h1qzouVWYA3NgzAC+5teVzNK3HotuuniYvboN3XpuNzsJ5xhFbOGJJtcm5J2BNtZ0GA4inu50IIIN1sRob7GVeU668LJGmCLa/WDRxun0c+S/kxv88T5H/wCI/MPGmuxeKWiAXvlN7EAtt1A1lJ4lSqqppsHIYH4T9mAg3jfE1qIAisDc6m2x3tYwFh3ZWuh1+8V5tg569u2Q9dO/94q1HMpFh5+hmLhmMzjUEEaajQ90JKf/AF+058svt07pkxVgqv7p2udie4x8TQBtcA+ssIBFjqPSVOpHw7dOXlLibLA7FcHRt1HdbSB8d2Op1HDOSbcuQ1vedSmIDcrHmDvJtKZ21y9Hs0tP/wDJig+XcQzSwxFu7n1mwqJMLGlWglWLwwZSDsZqEqqtAPNuNYX2b2B08oAxNMlrnWei9osGChbQHe5HTl3ThXqKozEC/IaGFsXJofiqIFiJHD0j8R0HhL3DObtYdNpIsvNhpy1iNjrYcObQXicLlMKtW10Ez4qqCNd4L2BZpyBSX2jGLTsijLFLooaWM7mNNYwvI6/iKnw8k7j8w8oy8azUyb6eUveiRr9Zuw9JBpYEjrNT0rjWZ35JrSfHc0IQ7dDtOk7McE9swqOP9NToPnYcv5RB3BuDtXq5F0Qau3yjoD1M9Ow9BURVUBVUWA6AS7f6KQqlMAXPgJhXDAkky+tVzHuG0VOXzMhWaejhVv4gj0P9ZcmHEQH9Jajgmxsp79AfAytpZDimIjTEtWk3dr/uX95ZkUas1+5df+WwjlLGBsMW0A/YeMiKYQjLqepG/gOQmypWvoBYdBz72POU5OcenOYixc65zcbC5I8CIW4dxAN7raMPT94LvE631GhGxk3mU/r6dVTueQv43B9JJk05jwsPUwJQ4y6oF9ndl0JLWXxsNZlxfE69j7yp3KNf+43inxFe7fwexNBSNyp5MDcj8TmeKcTq07BCH1scw3HXSZqFUsVzksb7klj6zP2nxeR0AtqpJ+sLPH0X234ftE17VEKnqNRaGMNxNWFwwnPcNqB1F9ZbTwYYNlOUg6d8UKx1KVri8gXuYIwqutrzViMUyKT0jJi7VVbUiJ50+VTa1yduk6PjXEnc7es55y1/h18oqqMz4Z73/MY4Q7ttNC4ltfdMi1z1iNVURVGh5ecyJgmem9Q8tvIxqj5mCAakgc51fF6ATDFEAuVA0i6qufdcHaMRJOCNwQe+RMnWlRJiiJij1Iib2sBFSw3zfTX+zCApA6y32e52M5vO/TacxkVFGg8hzka2JCabmx/u0T03vdiLa9L69TMVRddAADpe945Notem8DwtJKS5LjMA7G2pZgLkwpkQi2YeYM5zgnEafskVnQMFykFgNtOcMpUU7MD5gzq555rj766laV4enJh9ZYvDejfaVLLRLxH/AKVZ/lrcj6RNw5+71klYjmZctZvmP1hg82T/AC9hy+hi/wAI/wAt/WEFxLdftLBijzsfKHs/OBJosP0n6SDJ3Q6uI6qPUR/aLzT1j9q8458rEFh8rTO6n6Axmw1I/wDz+0NPygGJmxZ0t1nR/wCAQ7Eeog7H8LYEFdR0v9jHKPKMuAw4DA9BOe7T1T7fKFvZFG197k6zrcIu/wBJkxeG0L23P5tI6u03JYWo6C6rpzBIEOYau2jLcX3HKOMMDNWAp33hE0UwdVSL7fiBuPcQAXLYm+lh94ZXDaQXxUKqn3bjmYrRJrjKnvDY6b/tMTuwa4FxtDGKRBrrlOzA6X7wdoOxDFe8HUGLV5kMcSQCLC99O8SnEV/duwtpI+109ZRWxBYe8LesCaezWFD1s5Gi/flCXabFXZUGttTLuEp7KlcixIzHwO05/EY0u7MRoT9BymfyVp8U2mZlOhG/UTLWwAJ93SXMo31vHZ+YmG2OmyUMfDOOV/CKbDWJ5etopp5Vl48iKabbW2k11vI0xrLkG5mFaRF6RIO0x4rC6XA0APW5/eEc3WO0J1YMc/XolQtxuNLC1vGd72YfNhkuNVzKb67MfwRObx4uvhDPY6tmpuvyv/5AGdHxdbXP83P8ddItJflH0EsFMd/kzD8yAMuQzqcSSp/ub63+8mqN8581X8WkRLBAJAv1U/8ASfwZPO/RT5kfcRlMkIwmKjfIfIj82khV/wBrfS/2MZZO8AYYhedx4qw+4jrXQ/qX6iODE1ufrGFiNfbWWq5GnLmJyPGe0dJHyJSao36mRBZPAkWYzk34hiVN6TYoXOgdrgC/QaCTauR6xUpggleh0gt8WhTLvpacLjuP4qmuV6rm4sxyrs3faEOz3E0qIEze8BbXn3zLym418bJo7TqICOs202UarMJw95W6ONjK1IpWxq2y8yJy4xZcsh21GvOWcQrVACQvLec+mMKtmO+2t4lS4uLlHKPlIblva/jKaaC7ITcA6HuO0y47FqXvfbQyFTGWVjYi/wBosPyU16ZW4kuG4c1KgB+FdT+IMxPEL6XJ6TdwTjSoCCDmO2mn15R6HQcaxFhkWcw5sbWhGs5YsS2pO0ytQ8e+c/XUvTp45yKAxB1H1jtfymDE1G21sDpe95LC4prgG5G0d5uaXlNxuWnppFEwPJopO1WRtpVNNt5ci8hMmGexyk+c2kjrMqE1Gtj4xVquW2l7mwje0A3jNdwRYjviXnpTjWYrZQNpp7EVSHqoeit12JBmJ8PlN7m5217ukfszWZcSFOmZXHS50YfadHxfbH5Z/F36NLlMyq0tV51vPagZNTMyvLFaAaAZMGZw19gZYl+dh/fdALg0atXVBmdlUdWIUesori6MAzA23GhnkvFaTpUdKueoynRndmBU7EDlFesVzz5PRMX2yoKctK9Z+iaJfvc6fS8E4njdd9Xy5T+hSVA8Tu04zDYdyt1sFOm/IcvCH8N8IX3bgcjtM+u62nEn2IUuKDZlt5zQMcmuu3hA3sdbny6eEt9mu5B+wMid9QePKfFKyOotqehFgR3wFQwzr7y2BB0Fze0N+zGl+sx43EqNjqJPVta8+vTZg+11SjZaq5h9D/WGsP20wzgZjkJ+YW9Zwao7tdxodr7QVij77C1gCdJfOo6kexJxHDuPddD5iU1uH0XIN1P0nlTIgyrma5A2tYEzfSwTjaq48GP7yvLC8dd5V4TT6LBPFsOgQgWLWsBOcbFFRY1ajagaM3nczUnEUAuCTr3m/wBZF7v5F8/FN90F/wAvJvc7eX3m7BYNAdjccj1iqI1RixOUA6Cx28ZMVAhBI0HiZHXVraccypYmuysLDTc8/r0kkxWfQafSPXxqAC9yCOQ0gpaozZgBofhinOw71gq6aWIB63laUgotoI1DFB+Vj0lpPfy7pPueh6vtmZ+sUoroxPK3heKXkL2Ilgbe7Yy9KL9dJFQFAvrIDEAE3J05DWY2f0ety0VI6/eaEUWFtJkSrpvqdtfxNCVORiNVXouwOUoot018NYPw+dMRSZgAuZRoeuh+8Opb8QZxmsqZTfUEHyB5TTjr2jv3HYq0tUzIji1+R1HnLkPWdsefftoVr7SxSPH7fSUBpNTGTRnJkw0oVpIGAXhpzfajhC1AHA1H25j8w+GjOgZSDzi6mw+bl15+nDkIJuQTYad3dLqOERGzC4a1v6mR4phXpMQgbqNb+ItJ4ZmIGdhfu3tyBF5z2Wfbp3YvSpc7TNj2zKyKbEjcaWPjJu9hfe393grFVndrZTYdBfWIYEs1amTZybd9x6yNDFAk59b894dTDBwG1Rtu7TnaY+I8NU6pZT6H9pU6l9FZjZhcjBSraj07pzWJN3b+Yx1ZkbQkEdDIMp+I878x5y+ecK3VuFXXN0OnjC9PEOwy/ET0tMFOugUAaG2pI37pfh8Qq7Mp10i6mq5q/IRcBTpb1lbfy+PL0khiyTa1wekuaopFmQ9x5TP2vUaNW6k2Nh/Z0lhqae8Proe6ZgEH6zvewEufFIRow77wvJzuqWp3IIa46G1rTLiKJBuu3SbVCgaWlBcX9630/EJsFsrOM5IKrY9QJqXEFdHBGkgWK6oe+37SdcB1za6cj1js0TrFxsQLGKYqZsOY8IpPgPIYqqGUgW18YJqoQLa3v9YaUHQDS/SVubHRb95Ey56xVjNwvDsWDG2nXl3iGqdMXuW28pTTqBVu1vOZMRWLkCk2tzp1hd6py5F2M4tlJRNTfc7DulH+DeorGorXI0J2UDU210lNHhzgktcFdQRYi81cL4i1yjtcdTpoZeZ9F9ul4XUzU0b/AGj0FvxNqmCODP7mX5WYeV7j7wmrzq4uxxdzOq0q0svMweWB5TNoUyQaUK8kGjNeDHvKQ0mGgAjtPw81aZKaOuo7yOvjtOcREpX1+K1yetuU7piDcHY6Tiu0OEdKg5oe64B8O8TP5OfWtfj6/AWviGLHKGI5kazZRFr2ubixvvJ4bCAe8pIvobba7Gxg7jOJYOUU2C2uf1MbcrbzGc79NbcX1uIonO7bWH5gavjWYm1wD+kEzXQ4Q7BWINmFx1tfn0hV+HIqnKpBt8XxE+ZlTx5L3XNrQa2Yrp36SDudAdhsOl4VViBpqbkW3P0keLYcZVYJlsLMLbdJc6Kxgp0CbWI16zSeE1OgN++0rwrEjKPLxhrA03tqb8hYk84uusGA64WsliAw6W19JavFn+FwDyPI/SdE1PQXufOBcflRiMgYnUNb+7xTraeVavC/euWmbGYU27h9TKhjnB0PpJUMewPvC4hZRqzAU1OtzccjNLju+kZKCN7w0J1iKlN9R1k1UYK18xve0lSPdpNbWa3OVugvaPSxkrWB0v5RTRkEUewP/9k=',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void menusito() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.amber.shade200,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Asignacion'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Jhonson'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('NortOeste'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
