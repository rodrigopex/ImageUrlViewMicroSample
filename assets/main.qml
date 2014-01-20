/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import utils.imageLoader 1.0

Page {
    Container {
        Label {
            horizontalAlignment: HorizontalAlignment.Center
            text: qsTr("Image from URL") + Retranslate.onLocaleOrLanguageChanged
            textStyle.base: SystemDefaults.TextStyles.BigText
        }

        ListView {
            layout: GridListLayout {
                
            }
            dataModel: ArrayDataModel {
                id: m
            }
            onCreationCompleted: {
                m.append(["http://developer.blackberry.com/devzone/files/design/bb10/images/communication_at_its_core.png", "http://developer.blackberry.com/devzone/files/design/bb10/images/top_image_key_principles.png", "http://developer.blackberry.com/devzone/files/design/bb10/images/content_is_king.png", "http://developer.blackberry.com/devzone/files/design/bb10/images/cinematic_experience.png", "http://developer.blackberry.com/devzone/files/design/bb10/images/fluid_workflow.png", "http://developer.blackberry.com/devzone/files/design/bb10/images/efficient_ergonomics.png", "http://developer.blackberry.com/devzone/files/design/bb10/images/moments_of_charm.png"])
            }
            listItemComponents: ListItemComponent {
                Container {
                    bottomMargin: 20
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        ActivityIndicator {
                            id: act
                            preferredHeight: 100
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Center
                            running: true
                        }
                    }
                    Container {
                        topPadding: 50
                        horizontalAlignment: HorizontalAlignment.Center
                        ImageView {
                            id: myImage
                            scalingMethod: ScalingMethod.AspectFit
                            implicitLayoutAnimationsEnabled: false //Only fade in animation is enabled
                            attachedObjects: ImageUrlLoader {
                                imageUrl: ListItemData
                                onImageDone: {
                                    act.stop()
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}