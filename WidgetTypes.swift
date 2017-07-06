//
//  WidgetView.swift
//  UI Master
//
//  Created by Ian Kohlert on 2017-07-04.
//  Copyright © 2017 aestusLabs. All rights reserved.
//

import Foundation

enum WidgetTypes {
    case textButton, slider, volumeControl
}

struct Widget {
    var helperText: String
    var widgetType: WidgetTypes
}
