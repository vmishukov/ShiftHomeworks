//
//  FeedModel.swift
//  homework-4
//
//  Created by Vladislav Mishukov on 10.05.2024.
//

import Foundation
import UIKit

struct FeedCollectionModel {
    let title: String
    let image: UIImage
}

struct FeedDetailedModel {
    let collectionModel: FeedCollectionModel
    let description: String
    let sourceLink: String
    
    
    static func createMockDate() -> [FeedDetailedModel] {
        [FeedDetailedModel(
            collectionModel: FeedCollectionModel(title: "Pilsner", image: .pilsner2),
            description: """
Этот светлый сорт родом из Чехии, но немцы не без основания считают его своим. Именно они «довели до ума» первоначальную рецептуру напитку. Первый Пилснер был выпущен в Германии в 1871 г. Это пиво низового брожения.

Напиток, сваренный на юге Германии, называют «pilsner» — он мягче по вкусу. Северные напитки именуются иначе — «pilsener» (или «pils»). Местное пиво имеет выраженные горькие ноты хмеля.

Во всех пилснерах ощущаются цветочные оттенки во вкусе. Среднестатистическая крепость — от 4 до 6 % об.
"""
            ,
            sourceLink: "https://ru.inshaker.com/trends/lifestyle/nemetskoe-pivo-10-populyarnyh-sortov"),
         FeedDetailedModel(
            collectionModel: FeedCollectionModel(title: "Weissbier", image: .weissbier),
             description: """
 Знаменитое пшеничное пиво, сваренное по технологии верхового брожения. Как правило, светлое нефильтрованное, но можно встретить и темные фильтрованные сорта. Средняя крепость — от 5 до 5,5 % об.

 Для производства пшеничного Weizenbier используется конкретный вид дрожжей, который дарит напитку вкусовые нюансы пряностей и специй, бананов. Сорт особенно любят на юге Германии.

 В категорию Weizenbier можно включить и некоторые другие сорта немецкого пенного из пшеницы — например, Kristallweizen и Weizenbock. Первый — кристально чистый, второй — с повышенным градусом. Но чаще эти сорта выделяют как отдельные, поскольку они обладают своим, ни с чем не сравнимым характером.
 """
             ,
             sourceLink: "https://ru.inshaker.com/trends/lifestyle/nemetskoe-pivo-10-populyarnyh-sortov"),
         FeedDetailedModel(
            collectionModel: FeedCollectionModel(title: "Altbier", image: .altbier),
             description: """
 Пиво приятного коричнево-янтарного цвета, которое много веков назад начали варить в Дюссельдорфе. Этот сорт часто называют гибридом классического лагера и эля. Дело в том, что напитки сбраживают элевыми дрожжами, но дополнительно выдерживают при сниженной температуре, как обычные лагеры.

 Во вкусе Altbier непременно присутствуют выраженные мотивы солода и хмеля. Средняя крепость — от 4,5 до 6 % об.
 """
             ,
             sourceLink: "https://ru.inshaker.com/trends/lifestyle/nemetskoe-pivo-10-populyarnyh-sortov"),
         FeedDetailedModel(
            collectionModel: FeedCollectionModel(title: "Bockbier", image: .bockbier),
             description: """
 Темный и светлый лагер повышенной крепости и плотности. Этому сорту нужно значительно больше времени для созревания, поэтому его начинают варить в строго определенные месяцы. Bockbier играет богатыми карамельными и фруктовыми тонами. Спиртуозность не различима — лишь на финише вступает в игру приятная горечь.

 У темного бока средняя крепость 6,3-7,2 % об. Светлый легче по спирту и мягче по вкусу.

 К категории Bockbier часто относят и некоторые другие сорта крепкого немецкого пива. Это, например, Doppelbock (до 13 % об) и Eisbock (до 14 % об).
 """
             ,
             sourceLink: "https://ru.inshaker.com/trends/lifestyle/nemetskoe-pivo-10-populyarnyh-sortov")
        ]
    }
}
