Assets {
  Id: 10716138659611216140
  Name: "GlobalMessageClient"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:ModalPopup"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:TitleText"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:MessageText"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:ShowDuration"
        Float: 10
      }
      Overrides {
        Name: "cs:Padding"
        Int: 100
      }
      Overrides {
        Name: "cs:ModalPopup:tooltip"
        String: "Reference to the sibling component \"Modal Popup\"."
      }
      Overrides {
        Name: "cs:TitleText:tooltip"
        String: "Reference to the UI Text used for the title of the message."
      }
      Overrides {
        Name: "cs:MessageText:tooltip"
        String: "Reference to the UI Text used for the body of the message."
      }
      Overrides {
        Name: "cs:ShowDuration:tooltip"
        String: "The amount of seconds during which the popup is active, before it goes away."
      }
      Overrides {
        Name: "cs:Padding:tooltip"
        String: "Extra space to the left and right of the message text. The popup UI automatically scales horizontally, based on the size of the message."
      }
    }
  }
  SerializationVersion: 103
}
