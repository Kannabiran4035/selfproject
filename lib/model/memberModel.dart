// To parse this JSON data, do
//
//     final memberPage = memberPageFromJson(jsonString);

import 'dart:convert';

MemberPage? memberPageFromJson(String str) => MemberPage.fromJson(json.decode(str));

String memberPageToJson(MemberPage? data) => json.encode(data!.toJson());

class MemberPage {
    MemberPage({
        this.result,
        this.error,
        this.status,
    });

    Result? result;
    dynamic error;
    String? status;

    factory MemberPage.fromJson(Map<String, dynamic> json) => MemberPage(
        result: Result.fromJson(json["result"]),
        error: json["error"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "error": error,
        "status": status,
    };
}

class Result {
    Result({
        this.member,
    });

    Member? member;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        member: Member.fromJson(json["member"]),
    );

    Map<String, dynamic> toJson() => {
        "member": member!.toJson(),
    };
}

class Member {
    Member({
        required this.content,
        this.pageable,
        this.totalPages,
        this.totalElements,
        this.last,
        this.first,
        this.sort,
        this.numberOfElements,
        this.size,
        this.number,
        this.empty,
    });

    List<Content> content;
    Pageable? pageable;
    int? totalPages;
    int? totalElements;
    bool? last;
    bool? first;
    Sort? sort;
    int? numberOfElements;
    int? size;
    int? number;
    bool? empty;

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        content: json["content"] == null ? [] : List<Content>.from(json["content"]!.map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        last: json["last"],
        first: json["first"],
        sort: Sort.fromJson(json["sort"]),
        numberOfElements: json["numberOfElements"],
        size: json["size"],
        number: json["number"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "content": content == null ? [] : List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable!.toJson(),
        "totalPages": totalPages,
        "totalElements": totalElements,
        "last": last,
        "first": first,
        "sort": sort!.toJson(),
        "numberOfElements": numberOfElements,
        "size": size,
        "number": number,
        "empty": empty,
    };
}

class Content {
    Content({
        this.id,
        this.memberCode,
        this.memberName,
        this.spouseName,
        this.children,
        this.address,
        this.cityName,
        this.taluk,
        this.district,
        this.pincode,
        this.mobileNo,
        this.whatsUpNo,
        this.emailId,
        this.photoImage,
        this.consentToProvideDetails,
        this.activeStatus,
        this.createdDateTime,
        this.createdBy,
        this.updatedDateTime,
        this.updatedBy,
        this.lastApprovedBy,
    });

    String? id;
    String? memberCode;
    String? memberName;
    String? spouseName;
    List<Child?>? children;
    String? address;
    String? cityName;
    String? taluk;
    String? district;
    String? pincode;
    String? mobileNo;
    String? whatsUpNo;
    String? emailId;
    String? photoImage;
    String? consentToProvideDetails;
    bool? activeStatus;
    DateTime? createdDateTime;
    String  ? createdBy;
    DateTime? updatedDateTime;
    String? updatedBy;
    dynamic lastApprovedBy;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        memberCode: json["memberCode"],
        memberName: json["memberName"],
        spouseName: json["spouseName"],
        children: json["children"] == null ? [] : List<Child?>.from(json["children"]!.map((x) => Child.fromJson(x))),
        address: json["address"],
        cityName: json["cityName"],
        taluk: json["taluk"],
        district: json["district"],
        pincode: json["pincode"],
        mobileNo: json["mobileNo"],
        whatsUpNo: json["whatsUpNo"],
        emailId: json["emailId"],
        photoImage: json["photoImage"],
        consentToProvideDetails: json["consentToProvideDetails"],
        activeStatus: json["activeStatus"],
        createdDateTime: DateTime.parse(json["createdDateTime"]),
        createdBy:json["createdBy"],
        updatedDateTime: DateTime.parse(json["updatedDateTime"]),
        updatedBy: json["updatedBy"],
        lastApprovedBy: json["lastApprovedBy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "memberCode": memberCode,
        "memberName": memberName,
        "spouseName": spouseName,
        "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x!.toJson())),
        "address": address,
        "cityName": cityName,
        "taluk": taluk,
        "district": district,
        "pincode": pincode,
        "mobileNo": mobileNo,
        "whatsUpNo": whatsUpNo,
        "emailId": emailId,
        "photoImage": photoImage,
        "consentToProvideDetails": consentToProvideDetails,
        "activeStatus": activeStatus,
        "createdDateTime": createdDateTime?.toIso8601String(),
        "createdBy": atedByValues.reverse![createdBy],
        "updatedDateTime": updatedDateTime?.toIso8601String(),
        "updatedBy": atedByValues.reverse![updatedBy],
        "lastApprovedBy": lastApprovedBy,
    };
}

class Child {
    Child({
        this.childName,
        this.gender,
        this.dob,
        this.qualification,
        this.designation,
        this.married,
    });

    String? childName;
    Gender? gender;
    String? dob;
    String? qualification;
    String? designation;
    bool? married;

    factory Child.fromJson(Map<String, dynamic> json) => Child(
        childName: json["childName"],
        gender: genderValues.map[json["gender"]],
        dob: json["dob"],
        qualification: json["qualification"],
        designation: json["designation"],
        married: json["married"],
    );

    Map<String, dynamic> toJson() => {
        "childName": childName,
        "gender": genderValues.reverse![gender],
        "dob": dob,
        "qualification": qualification,
        "designation": designation,
        "married": married,
    };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
    "FEMALE": Gender.FEMALE,
    "MALE": Gender.MALE
});

enum AtedBy { TEST123 }

final atedByValues = EnumValues({
    "Test123": AtedBy.TEST123
});

class Pageable {
    Pageable({
        this.sort,
        this.pageNumber,
        this.pageSize,
        this.offset,
        this.unpaged,
        this.paged,
    });

    Sort? sort;
    int? pageNumber;
    int? pageSize;
    int? offset;
    bool? unpaged;
    bool? paged;

    factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        offset: json["offset"],
        unpaged: json["unpaged"],
        paged: json["paged"],
    );

    Map<String, dynamic> toJson() => {
        "sort": sort!.toJson(),
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "offset": offset,
        "unpaged": unpaged,
        "paged": paged,
    };
}

class Sort {
    Sort({
        this.sorted,
        this.unsorted,
        this.empty,
    });

    bool? sorted;
    bool? unsorted;
    bool? empty;

    factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
    );

    Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
