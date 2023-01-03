
## Flutter- Freezed Paketi.
Bu makaleyi okuduğunuzda Flutter uygulamalarınızda nasıl kolay bir şekilde undo & redo fonksiyonalitesi ekleyebiliceğinizi öğreneceksiniz.


Bugünlerde komunitelerde ve youtube videolarını izlerken sıkça immutable kodlama teknikleri ile ilgili tartışmalar sıklaşmaya başladı. Immutabilite bir nesnenin oluşturulduktan sonra değişmemesi gerektiği fikridir. Nesneler ve sınıflar için bu, içerdikleri tüm değişkenleride içerir. Ve değişmez nesneler kullanarak, pek de belirli olmayan bazı olumsuz etkilerden kaçınabiliriz. Bu tarz, programlamayı daha işlevsel bir paradigma ile düşünmeyi gerektirir.

Değişken nesnelerle çalışırken, tamsayılar listesindeki bir .sort fonksiyonunu büyükten küçüğe doğru çağırırken, yani [3,2,1], bu çok açık olmayan bir olumsuz etkinin klasik bir örneğidir. Şimdi listeyi değiştiren ve döndüren bir method kullanarak bir newList yapalım. Görünüşe göre newList doğru gibi görünsede, orijinal mutableList’imizi yazdırmaya çalıştığımızda, oluşturduğumuzdan farklı çıkıyor sonuç. Bunu yapmanın sonucu, Hem mutableList hem de newList sırasının artan sırada olmasıdır, yani [1,2,3].


Bu makale sizin immutable programlamayı daha iyi anlamanızı ve olumsuz etkilerini bir Flutter appi ile gösterip ardından Freezed paketi ile bundan nasıl kurtulup çözüme ulaşacağınızın örneğini yapıp öğretmeyi amaçlamaktadır.

Bu sorulara cevap bulacaksınız.
Freeze paketi nedir neden kullanılır Freezed Package?
Kodunuza nasıl undo ve redo gibi geri al, ileri al fonksionalitelerini eklerim?
Nasıl mutable kod yazabilirim?
Immutable kodumu nasıl yeniden düzenler mutable code yapabilirim?
Freezed nedir?

https://pub.dev/packages/freezed
Freezed dart programlama dilinde çoğunlukla modeller olmak üzere veri sınıflarımızı oluşturan bir code generate(kod oluşturma) paketidir. Hatalı kod varsa generate(üretim-oluşturma) yapmaycağı için bir ton hatalı kod yazmanızı engeller. Dart harika bir dil fakat model tanımlamak bazen sıkıcı olabiliyor. Güzel bir model sınıfı oluşturmak için şu adımları yapmamız gerekiyor

#Contrusctor tanımlamak ve özelliklerini eklemek

# toString, operator ==, ve hasCode larını @override etmek

#copyWith methodunu ekleyip ileri safalarda clone objeler üretmek

#serilizazyonu ve deserilizasyonu sağlamak

Ve dart bazı önemli gelişmeleride kaçırmış durumda örnek olarak union tipler ve patternleri eşleştirme.

Tüm bunları yapmak freeze olmadan yüzlerce satır tutucağından okumayı ve hatalarla karşılaşma ihtimalimizi arttırıcakken freeze bizim için bu implementasyonu güzel bir şekilde sağlamakta.

Freezed olmadan


Ve Freezed ile bunu okunabilirliği daha yüksek ve daha kısa şekilde şu şekilde yapabiliyoruz.

Freezed ile


Minimal Freezed uygulanabilir bir app düşünelim.
Bu app listede sınıf objeleri barındırıyor (objelerimiz nested dataya sahip).
Bu app geri al e ileri al butonlarına sahip ve butonlar ile listedeki sınıf listeleri arasında geçiş yapmamızı sağlayacak.
Bu app bize kulanıcı arayüzünde mevcut durum için nested dataları ekranda görüntülüyecek.
Bu class objeleri nested yapıdadır bu örnekte göreceğiniz gibi:

List<NestedClass>
|-- List<NestedClass>
|   |-- List<NestedClass>
|   |   |-- List<NestedClass>

Bu yeşil renkle çizilmiş app diyagramı UI ile ilgili amaçlanan fonksiyonaliteyi gösterir.

Özet olarak widgetlar şu amaçlara sahip:

AppBar hangi sınıf objesinin şu an ekranda gösterileceğini,
ListViewBuilder ise sınıf objelerinde tutulan dataları ve diplerindeki nested dataları gösterecek,
Undo ve redo butonlarıysa listede tutulan bu nested datalar arasında geçiş yapmamızı sağlayacak.
Çalışan demomuz:


İlk soru problem ne?
Sorunu çözerken arkadaşlar sizinde main branchimizde duran sorunun bulunduğu kodu incelemenizi istiyorum buraya linkini bırakıyorum.

https://github.com/hberkayozdemir/how_to_use_freezed

Main branchimizde sorunlu olan kodumuz var önce bunu ardında çözümü ve freezed implementasyonunu barındıran https://github.com/hberkayozdemir/how_to_use_freezed/tree/fix/fix-the-problem-with-freezed-package branchine giderek kodları inceleyebilirsiniz.

Lafı daha fazla uzatmadan soruna geçelim!


Makalede sıkça adı geçen sınıf objelerini burda NestedClass olarak tanımladık. Bu basit classımız name, surname ve yaş değişkenlerini taşıyor. Bu sınıf aynı zamanda children variable yani çocukları (soyun devamı) adında List<NestedClass> değişkenini taşıyor. Bu liste değişkeni bize sınıf objelerinin derin nested dataları barındırmasını sağlıyor. Burada iki metod var addChild ve copyWith, ve NestedClassın initial constructor’u. Burada immutable kod ile ilgili sorun şudur addChild methodu


çünkü bir nested class ekleyerek alt değikeni değiştirmeyi hedeflemiş fakat bu modifikasyon mümkün değildir. Immutable kodlamada class initial constrcutoru derlendiğinde initial durumdan geçtikten sonra herhangi bir değişkeni değiştiremezsiniz.

Tabiki sonuç kısmında göstericeğim gibi Freezed kullanmazsanız :)

Sınıf Objeleri
Açıklık getirmek için sınıf objelerimizide buraya koydum. Tüm sınıf objelerimiz burada hard coded halde bulunmakta. Tabiki canlıya alınması planlanan bir appte bu şekilde olmaz burası sadece öğrenmemiz için bir makale POC’si (Proof of Concept- Konseptin Kanıtı).


Tekli sınıf objeleri daha sonra iç içe(nested) olacak.

Sınıf Objelerini derinlemesine iç içe hale getirme
Burada sınıf objelerimizi iç içe hale getiriyoruz.


Canlıdaki bir uygulamanın kodu tamamen farklı olurdu fakat burada aynı süreci uygular:

Sınıfımızda uygulamanın başlamasından sonra initial hale gelmesiyle birlikte çocuklar listesine bir üye eklemek için method cağırılır. Bu durumda, .addChild methodunu gereğinden fazla vurgulamak için koda en ilkel haliyle bakmanın daha iyi olacağını düşündüm. Bu kod entityleri (oluşan varlıklar) oldukça hard coded şekilde sabitler. Bununla birlikte, bu kodta, şu anda olduğu gibi veya daha karmaşık bir biçimde, değişmez kodlama düşüncesini kullanırken .addChild yöntem çağrısını kullanamayacağını, çünkü bu, child değişkenini değiştirmemize neden olacağını görülüyor.

Burada Fonksiyonel Programlama Düşüncesi kurallarını uygulamalıyız.
Bizim için en çok zorluk çıkaracak sınıf delete.dart’tır. Bu sınıfta nesneleri hiyerarşiden kaldırmak için logic’i burada gözden geçirelim.

Fonksiyonel programlama son günlerde daha da popüler hale geliyor ve bunun sebepleri çok açık. Fonksiyonel programlamada bir datayı modifye etmenin adımları şunlardır:

Yazarken-kopyala (copy-on-write)

1.Değişmesini önlemek için sınıf objesinin bir kopyasını oluşturur.

2.Kopyayı değiştirir.

3.Değiştirilmiş kopyayı döner.

Bizim kodumuzda ise bunu şöyle yapabiliriz

İlk olarak kod, geçirilen hiyerarşi sınıf nesnesini kopyalar. Burada sorunumuz şu ki hiyerarşiyi kopyalasak bile onu derin bir şekilde kopyalayamıyoruz ve kopyalanan hiyerarşideki değişikliklerimiz hiyerarşi sınıfı nesnesinde değişikliklere neden olacak.

İkinci olarakta kodtaki çocuk nesnesini .remove(nesne) si ile değiştirerek verileri değiştirmeyi hedefler ama bu değişiklikte yine mümkün değil.

Üçüncüsü, kod kopyalanan ve değiştirilen sınıf nesnesini geri döndürür.

NestedClass delete({   required NestedClass object,   required NestedClass hierarchy, }) {   // 1. copy the hierarchy.   final copiedHierarchy = hierarchy;   {     if (object == copiedHierarchy) {       return NestedClass.initial();     }     // 2. modifies.     if (copiedHierarchy.children.contains(object)) {       copiedHierarchy.children.remove(object);     } else {       for (NestedClass child in copiedHierarchy.children) {         delete(object: object, hierarchy: child);       }     }     // 3. returns copied and modified hierarchy     return copiedHierarchy.copyWith(children: [...copiedHierarchy.children]);   } }
Özellikle, ‘sığ bir şekilde kopyalama(shallow copy)’ değişkenliği durdurmaz. Freezed paketi ise , sınıf nesnelerini değişmez bir şekilde “derin kopyalama” yapmamızı sağlar.

Freezed paketi uygularken, gerçekten fonksiyonel bir programlama düşüncesi için farklı bir strateji kullanacağız.

Geri al düğmesine basmak, yedi sınıf nesnesi listesinde gezinmeyi sağlar. Her sınıf nesnesi diğerlerinden farklı olduğu için butona basarak listeyi kaydırdığımızda UI’da bir değişiklik görmeliyiz. Ancak GIF, kullanıcı arayüzünün her sınıf nesnesi için aynı kaldığını ortaya koymaktadır. Değişken oldukları için sınıf nesneleri beklenmedik bir şekilde değişiyor! Bu tür bir olumsuz etki, yukarıdaki örnek ile aynıdır.


Çözüm zamanı!
Freeze Your Code!
Freezed paketinin kullanımı mükemmel gerçekleştiren ve videosunu paylaşan ResoCoder kanalından izleyebilirsiniz


Zamanınızıda almamak için size generate edeceğiniz modeli doğru biçimde paylaşayım. :)

import 'package:freezed_annotation/freezed_annotation.dart';part 'nested_class.freezed.dart';@freezed
class NestedClass with _$NestedClass {
  const NestedClass._();
  const factory NestedClass({
    required String name,
    required String surname,
    required int age,
    required List<NestedClass> children,
  }) = _NestedClass;
}
Ben nasıl implement ettim
5 adımdan oluşuyor:

1. Gerekli kütüphanelerimizi pubspec.yaml dosyamıza ekliyoruz.
freezed: ^2.1.1
freezed_annotation: ^2.1.0
build_runner: ^2.2.1
2. NestedClassımıza inital factoryConsrustoru ekliyoruz.
part 'nested_class.freezed.dart';
@freezed 
class NestedClass with _$NestedClass {   
const NestedClass._();  const factory NestedClass({required String name,required String surname,required int age,     required List<NestedClass> children, }) = _NestedClass; 

factory NestedClass.initial() => const NestedClass(name: 'Soy Ağacı', surname: 'Yaş Çizgisi', age: 500, children: []); 
}
3. Freezed’i konsol komutunu tetikleyerek çalıştırıyoruz.
dart run build_runner watch --delete-conflicting-outputs
4. loadFamilyTree’de addChild methodlarını .copyWith ‘e dönüştürüyoruz
NestedClass loadFamilyTree() {
var newParents1 = parents1.copyWith(children: [     children1,     children2,   ]);    
var newParents2 = parents2.copyWith(children: [     children3,     children4,   ]);
var newParents3 = parents3.copyWith(children: [     children5,     children6,   ]);
var newGrandParents1 = grandParents1.copyWith(children: [     newParents1,     newParents2,     newParents3,   ]);
var newGrandParents2 = grandParents2.copyWith(children: []);
var newGreatGrandParents = greatGrandParents.copyWith(children: [     newGrandParents1,     newGrandParents2,   ]);    
var newFamilyTree = familyHierarchy.copyWith(children: [     newGreatGrandParents,   ]);    
return newFamilyTree; }
Şimdi kodumuzu değişmez hale getirelim. Alternatif olarak kullanılan modifikasyon fonksiyonlarını immutable düşünce kullanımını için copyWith ile gerçekleştirdik.

5. Delete fonksiyonunu fonksiyonel programlama teknikleri ile değiştiricez.
Burada yazarken-kopyala (copy-on-write) tekniği kullanacağız

NestedClass delete({
required NestedClass object,   required NestedClass hierarchy, }) {   // 1. copy the hierarchy.   
NestedClass? copiedHierarchy =       hierarchy.children.contains(object) ? hierarchy : null;  
 // 2. modifies.  
 if (copiedHierarchy != null) {    
return hierarchy.copyWith(children: [for (var child in hierarchy.children)         if (child != object) child,]);   }   
 // 3. returns copied and modified hierarchy.return hierarchy.copyWith(children: [for (var child in hierarchy.children) delete(object: object, hierarchy: child),],); }
Düşünce için kodlamayı yeniden düşünmek zorunda kaldım

Burada yeni versiyon çok daha bağımlı oldu .copyWith kullandığımız için.

Ve bunu çözmek içinde null-able bir sınıf ürettim.Üst sınıf nesnesinin aranan sınıf nesnesini içerip içermediğini kontrol eden bir mantık geliştirdim.

// 1. Conditionally copy the hierarchy.
NestedClass? copiedHierarchy = hierarchy.children.contains(object) ? hierarchy : null;
Daha önce yazdığım copiedHierarchy objesini burada if else koşullarıyla sorgulayarak null bir class objesi varsa silerek değiştiriceğiz

// 2. Hiyerarşinin alt üyelerini koşula uyarak değiştirir 
if (copiedHierarchy != null) {     
return hierarchy.copyWith(children: [for (var child in hierarchy.children)        
 if (child != object) child,]); 
}
Adım Adım Mantık nasıl işledi

Parent sınıfları koşulla sorgulama : Parent sınıflarda obje içermiyorsa null döndürdük.
Dibe indik-Eğer bir sınıf nesnesi varsa, nesne hariç yeni bir çocuk listesi yapılır. Ardından, en son çocuk listesiyle sınıf nesnesini kopyalayın ve kopyayı döndürün.
Dibe indik — Eğer null bir nesne varsa dipte modifiye edilmemiş kopya döndürdük.
Sürekli Fonksiyon- Kendi kendini sürekli bir şekilde çağırarak bu işlemi bitene kadar yaptırarak sonuca vardık :).
return hierarchy.copyWith(children: [
for (var child in hierarchy.children)       
// Recursively call method     
delete(object: object, hierarchy: child),
  ],
);
Ve sonuç !

