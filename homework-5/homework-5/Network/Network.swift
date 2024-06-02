//
//  NetworkService.swift
//  homework-5
//
//  Created by Vladislav Mishukov on 23.05.2024.
//

import Foundation

protocol NetworkClientProtocol {
    func getFeed(completion: @escaping ([FeedNetworkModel]) -> Void)
}

final class NetworkClient: NetworkClientProtocol {
    func getFeed(completion: @escaping ([FeedNetworkModel]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(
                [
                    FeedNetworkModel(
                        title: "Pilsner",
                        image: .pilsner2,
                        description: """
            Этот светлый сорт родом из Чехии, но немцы не без основания считают его своим. Именно они «довели до ума» первоначальную рецептуру напитку. Первый Пилснер был выпущен в Германии в 1871 г. Это пиво низового брожения.
            
            Напиток, сваренный на юге Германии, называют «pilsner» — он мягче по вкусу. Северные напитки именуются иначе — «pilsener» (или «pils»). Местное пиво имеет выраженные горькие ноты хмеля.
            
            Во всех пилснерах ощущаются цветочные оттенки во вкусе. Среднестатистическая крепость — от 4 до 6 % об.
            """
                        ,
                        sourceLink: "https://ru.inshaker.com/trends/lifestyle/nemetskoe-pivo-10-populyarnyh-sortov"),
                    
                    FeedNetworkModel(
                        title: "Weissbier",
                        image: .weissbier,
                        description: """
             Знаменитое пшеничное пиво, сваренное по технологии верхового брожения. Как правило, светлое нефильтрованное, но можно встретить и темные фильтрованные сорта. Средняя крепость — от 5 до 5,5 % об.
             
             Для производства пшеничного Weizenbier используется конкретный вид дрожжей, который дарит напитку вкусовые нюансы пряностей и специй, бананов. Сорт особенно любят на юге Германии.
             
             В категорию Weizenbier можно включить и некоторые другие сорта немецкого пенного из пшеницы — например, Kristallweizen и Weizenbock. Первый — кристально чистый, второй — с повышенным градусом. Но чаще эти сорта выделяют как отдельные, поскольку они обладают своим, ни с чем не сравнимым характером.
             """
                        ,
                        sourceLink: "https://ru.inshaker.com/trends/lifestyle/nemetskoe-pivo-10-populyarnyh-sortov"),
                    FeedNetworkModel(
                        title: "Altbier",
                        image: .altbier,
                        description: """
             Пиво приятного коричнево-янтарного цвета, которое много веков назад начали варить в Дюссельдорфе. Этот сорт часто называют гибридом классического лагера и эля. Дело в том, что напитки сбраживают элевыми дрожжами, но дополнительно выдерживают при сниженной температуре, как обычные лагеры.
             
             Во вкусе Altbier непременно присутствуют выраженные мотивы солода и хмеля. Средняя крепость — от 4,5 до 6 % об.
             """
                        ,
                        sourceLink: "https://ru.inshaker.com/trends/lifestyle/nemetskoe-pivo-10-populyarnyh-sortov"),
                    FeedNetworkModel(
                        title: "Bockbier",
                        image: .bockbier,
                        description: """
             Темный и светлый лагер повышенной крепости и плотности. Этому сорту нужно значительно больше времени для созревания, поэтому его начинают варить в строго определенные месяцы. Bockbier играет богатыми карамельными и фруктовыми тонами. Спиртуозность не различима — лишь на финише вступает в игру приятная горечь.
             
             У темного бока средняя крепость 6,3-7,2 % об. Светлый легче по спирту и мягче по вкусу.
             
             К категории Bockbier часто относят и некоторые другие сорта крепкого немецкого пива. Это, например, Doppelbock (до 13 % об) и Eisbock (до 14 % об).
             """
                        ,
                        sourceLink: "https://ru.inshaker.com/trends/lifestyle/nemetskoe-pivo-10-populyarnyh-sortov"),
                    FeedNetworkModel(
                        title: "Стаут",
                        image: .stout,
                        description: """
             В 1756 Артур Гиннесс основал пивоварню, о которой сегодня не слышал только совсем далекий от мира алкогольных напитков человек. В 1759 году производство переехало в Дублин. Изначально Гиннесс варил эль, но со временем перешел на лондонский портер, а затем и на стаут.
             Пиво Гиннесс (Guinness) долгое время было лидером продаж на локальном рынке, оно отличается плотной «сливочной» структурой, насыщенным вкусом и ярким послевкусием.
             Гиннесс – самый известный, но не единственный производитель стаута. Это темное ирландское пиво встречается в ассортименте крафтовых пивоварен, например, Franciscan Well, Carlow Brewing Company, Dungarvan Brewing Company, Galway Hooker Brewery.
             """
                        ,
                        sourceLink: "https://alcofan.com/kharakteristika-piva-irlandii.html"),
                    FeedNetworkModel(
                        title: "Красный эль",
                        image: .redale,
                        description: """
             Большая часть производимых в Ирландии элей относится именно к этому стилю. Напиток отличается красноватым оттенком и обладает крепостью 3.8-4.4%, хотя экспортные версии могут быть крепче. Самый известный бренд – Smithwick’s от пивоварни Diageo. Другие популярные марки: Rebel Red, O’Hara’s Irish Red, Messrs Maguire Rusty, Copper Coast.
             """
                        ,
                        sourceLink: "https://alcofan.com/kharakteristika-piva-irlandii.html"),
                    FeedNetworkModel(
                        title: "Чешский светлый премиум-лагер",
                        image: .czechlager,
                        description: """
             Группа светлых лагеров, обладающих сбалансированным освежающим вкусом, насыщенным солодово-хмелевым ароматом, скругленным профилем. По сути, это пильзнеры, но в Чехии, на родине этого пивного стиля, пильзнером может называться только оригинальный Urquell, поэтому для других марок подобрали иное название.
             Букет сложный, превалировать могут как солодовые, так и хмелевые нотки. Также чувствуются тона пряностей, цветов, трав. Цвет насыщенно золотистый, в бокале образует плотную пену кремового цвета.
             Отличительная особенность стиля – глубокий, насыщенный вкус с явной хмелевой горчинкой и округлыми сладковатыми тонами солода. Иногда встречаются нотки карамели.
             Напиток среднетелый, слабонасыщенный углекислым газом, не «газированный», язык не пощипывает. Иногда может быть дополнительно карбонизирован дрожжами или бродящим суслом.
             Оригинальный Pilsner Urquell появился в 1842 году, когда рынок отчаянно нуждался в новом пивном стиле. Производимые на тот момент хмельные напитки были настолько плохи, что группа пивоваров как-то публично вылила на площади бочонок пенного.
             В состав чешского светлого премиум-лагера входят жатецкий хмель, солод, лагерные дрожжи. Характерный мягкий вкус появляется за счет использования местной воды, содержащей ионы. Стиль сравним с немецким пилзом, но обладает более интенсивным вкусом и глубоким цветом. Крепче обычного чешского светлого лагера.
             """
                        ,
                        sourceLink: "https://alcofan.com/stil-piva-cheshskij-svetlyj-premium-lager.html"),
                    FeedNetworkModel(
                        title: "Двойной IPA",
                        image: .doubleipa,
                        description: """
             Термин «двойной» относится к крепости – напиток в полтора-два раза крепче большинства индийских элей. Также могут встречаться названия «имперский» или «экстра». Стиль появился во второй половине 1990-х годов, главная его задача – «обыграть» хмелевой профиль, показать как можно больше хмелевых оттенков и нюансов.
             Солодовая составляющая глубоко вторична, ни о какой сложности здесь говорить не приходится. Напиток сильно охмелен, почти без сладости. но пьется легко. В аромате чувствуется вся палитра хмелевых нот: фрукты, пряности, смола, ель и т.д. Брожение чистое, благодаря повышенному содержанию алкоголя напиток хорошо согревает, но не обжигает.
             Двойной IPA обладает золотисто-медным цветом, обычно прозрачный, но нефильтрованные версии могут быть мутноватыми. Пенообразование среднее, «шапка» светлая, стойкая.
             Основная характеристика вкуса – сильная горечь, на фоне которой почти теряется солодовая сладость с тонами карамели и тостов. Послевкусие горькое. Легкие сернистые нотки не противоречат определению стиля, но дубовые тона свидетельствуют об ошибках в технологии.
             На языке напиток ощущается мягким, не жгучим, легко- или среднетелым. Изготавливается из двурядного солода, иногда с незначительным добавлением карамельного. Главный ингредиент – сложный набор американских хмелей, пивовары любят экспериментировать с этим компонентом. Дрожжи могут быть как чистыми, так и слегка фруктовыми.
             Двойной IPA крепче, более горький и охмеленный чем его английский и американский аналоги. По сравнению с барливайном менее солодовый.
             """
                        ,
                        sourceLink: "https://alcofan.com/stil-piva-dvojnoj-ipa.html"),
                    FeedNetworkModel(
                        title: "Бельгийский золотой крепкий эль",
                        image: .belgiangold,
                        description: """
             После Первой мировой войны особой популярностью стали пользоваться пильзнеры, бельгийский золотой крепкий эль появился в качестве альтернативы. Забавный факт: производители любят давать брендам этого стиля «дьявольские» названия с упоминанием нечистого – это намек на «адскую» крепость напитка. Этот эль отличается сложным интересным вкусом. Изготавливается почти как шампанское – с вторичным брожением в бутылке, в результате получается сильно карбонизированный продукт.
             Это игристый напиток с явными фруктовыми нотами и умеренными тонами хмеля и солода. Алкоголь чувствуется приятным теплом, спирты ароматные, не обжигающие. В букете чувствуются нюансы зерна, пряностей, цветов. Вкус с горчинкой, но солодовая сладость сохраняется до финиша. Сам финиш сухой, послевкусие горьковатое.
             Как и следует из названия, бельгийский золотой эль обладает золотистым цветом. В бокале образует обильную и стойкую пену, оседающую на стенках «кружевом». Это настоящая пивная «шипучка», напиток очень газированный, но, несмотря на высокую плотность, легкотелый. Пьется легко, сивушные ноты противоречат стандартам стиля.
             Эль изготавливается на основе солода пилс и сахара, хмели нужны жатецкие, дрожжи – бельгийские. Пряности редко добавляют в качестве отдельного ингредиента, они чувствуются в хмелевом профиле, но стандартами стиля это не запрещено.
             Золотой эль похож на легкотелый сухой трипель, только более охмеленный и дрожжевой. Один из главных признаков стиля – интенсивный эфирный профиль.
             """
                        ,
                        sourceLink: "https://alcofan.com/stil-piva-belgijskij-zolotoj-krepkij-el.html"),
                    FeedNetworkModel(
                        title: "Витбир",
                        image: .witbier,
                        description: """
             Бельгийское пшеничное пиво верхового брожения, появившееся в XVII веке и успешно прекратившее свое существование в середине XX-го. Было восстановлено, сейчас изготавливается крафтовыми пивоварами и несколькими крупными пивзаводами. Относится к категории легких и освежающих стилей. Витбир бывает пряным или кисловатым, но эти характеристики должны быть умеренными. Бланш пьют преимущественно молодым, так как выдержка не идет на пользу вкусу и аромату напитка.
             В букете чувствуются солодовые тона, проявляющиеся нюансами ванили или меда, зерно, пряности, кислинка, кориандр, цитрусы. Хмель может давать пряно-землистые, цветочные нотки, но этот профиль всегда фоновый, никогда не выходит на передний план.
             Витбир обычно сладковатый с кислинкой, хмелевая горчинка если и присутствует, то слабо, главная особенность вкуса – специи. Финиш сухой.
             На цвет эль очень светлый, только слегка желтый, благодаря дрожжевой взвести чуть белесоватый. В бокале образует плотную стойкую пену. Бланш пьется очень легко, мягко, оставляя на языке кремовое послевкусие. Это среднетелое пиво с высокой карбонизацией, терпкие нотки запрещены стандартами стиля.
             Засыпь состоит из равных долей несоложеной пшеницы и пилса, некоторые производители могут добавлять чуть-чуть овса. Обязательные ингредиенты: кориандр, цедра померанцев или апельсинов. В зависимости от производителя – другие пряности. Дрожжи – элевые, усиливающие пряный профиль. Иногда применяется малолактическое брожение.
             Стиль похож на классический вайсбир, но с добавлением пряностей.
             """
                        ,
                        sourceLink: "https://alcofan.com/stil-piva-vitbir.html"),
                ].shuffled()
            )
        }
    }
}
