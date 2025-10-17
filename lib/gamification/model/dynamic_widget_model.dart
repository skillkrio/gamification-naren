class DynamicWidgetModel {
    DynamicWidgetModel({
        required this.screens,
    });

    final List<Screen> screens;

    factory DynamicWidgetModel.fromJson(Map<String, dynamic> json){ 
        return DynamicWidgetModel(
            screens: json["screens"] == null ? [] : List<Screen>.from(json["screens"]!.map((x) => Screen.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "screens": screens.map((x) => x?.toJson()).toList(),
    };

}

class ChildScreen {
    ChildScreen({
        required this.frontend,
        required this.backend,
        required this.designer,
    });

    final List<Screen> frontend;
    final List<Screen> backend;
    final List<Screen> designer;

    factory ChildScreen.fromJson(Map<String, dynamic> json){ 
        return ChildScreen(
            frontend: json["frontend"] == null ? [] : List<Screen>.from(json["frontend"]!.map((x) => Screen.fromJson(x))),
            backend: json["backend"] == null ? [] : List<Screen>.from(json["backend"]!.map((x) => Screen.fromJson(x))),
            designer: json["designer"] == null ? [] : List<Screen>.from(json["designer"]!.map((x) => Screen.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "frontend": frontend.map((x) => x?.toJson()).toList(),
        "backend": backend.map((x) => x?.toJson()).toList(),
        "designer": designer.map((x) => x?.toJson()).toList(),
    };

}

class Screen {
    Screen({
        required this.screenName,
        required this.heading,
        required this.question,
        required this.hintText,
        required this.fields,
        required this.options,
        required this.ans,
        required this.childScreen,
    });

    final String? screenName;
    final String? heading;
    final String? question;
    final String? hintText;
    final List<String> fields;
    final List<Option> options;
    final dynamic ans;
    final ChildScreen? childScreen;

    factory Screen.fromJson(Map<String, dynamic> json){ 
        return Screen(
            screenName: json["screen_name"],
            heading: json["heading"],
            question: json["question"],
            hintText: json["hint_text"],
            fields: json["fields"] == null ? [] : List<String>.from(json["fields"]!.map((x) => x)),
            options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
            ans: json["ans"],
            childScreen: json["child_screen"] == null ? null : ChildScreen.fromJson(json["child_screen"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "screen_name": screenName,
        "heading": heading,
        "question": question,
        "hint_text": hintText,
        "fields": fields.map((x) => x).toList(),
        "options": options.map((x) => x?.toJson()).toList(),
        "ans": ans,
        "child_screen": childScreen?.toJson(),
    };

}

class Option {
    Option({
        required this.text,
        required this.value,
        required this.key,
    });

    final String? text;
    final String? value;
    final String? key;

    factory Option.fromJson(Map<String, dynamic> json){ 
        return Option(
            text: json["text"],
            value: json["value"],
            key: json["key"],
        );
    }

    Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
        "key": key,
    };

}
