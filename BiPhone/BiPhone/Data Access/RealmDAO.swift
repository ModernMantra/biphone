//
//  RealmDAO.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 21/12/2020.
//

import Foundation
import RealmSwift

class RealmDAO<T: Object> {

    func load() -> [T]? {
        guard let realm = try? Realm() else { return nil }
        return realm.objects(T.self).toArray(ofType: T.self) as [T]
    }

    func delete() {
        guard let realm = try? Realm() else { return }
        try? realm.write {
            realm.delete(realm.objects(T.self))
        }
    }

    func save(data: [T]) {
        guard let realm = try? Realm() else { return }
        try? realm.write {
            realm.add(data)
        }
    }

    func hasAnyData() -> Bool {
        guard let realm = try? Realm() else { return false }
        return realm.objects(T.self).count > 0
    }

}
