import 'package:flutter/material.dart';
import 'package:newsprovider/src/models/news_models.dart';
import 'package:newsprovider/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias(this.noticias);



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.noticias.length,
        itemBuilder: (BuildContext context, int i){
          return _Noticia(noticia: this.noticias[i], index: i,);
        });
  }
}



class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({
    @required this.noticia,
    @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(noticia: noticia, index: index,),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia,),
        _TarjetaBody(noticia:noticia),
        _TarjetaBotones(),
        SizedBox(height: 10,),
        Divider(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RawMaterialButton(
          fillColor: miTema.accentColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: (){},
          child: Icon(Icons.star_border),
        ),
        SizedBox(width: 10,),
        RawMaterialButton(
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: (){},
          child: Icon(Icons.more),
        ),
      ],
    );
  }
}


class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody({this.noticia}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description != null)? noticia.description : ''),
    );
  }
}


class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({this.noticia});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      child:ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(placeholder: AssetImage('assets/img/giphy.gif'), image: NetworkImage(noticia.urlToImage))
                : Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
  }
}



class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}


class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaTopBar({
    this.noticia,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}.', style: TextStyle(color: miTema.accentColor),),
          Flexible(
            child: Text((noticia.author != null) ? noticia.author : 'Sin Fuente',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
          ))
        ],
      ),
    );
  }
}
