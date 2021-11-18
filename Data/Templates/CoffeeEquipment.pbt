Assets {
  Id: 1675220947145476043
  Name: "CoffeeEquipment"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 12792248877237016915
      Objects {
        Id: 12792248877237016915
        Name: "CoffeeEquipment"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 3807918045201516918
        ChildIds: 13430801892565878085
        ChildIds: 9995370169798204568
        UnregisteredParameters {
          Overrides {
            Name: "cs:IsDrinking"
            Bool: false
          }
          Overrides {
            Name: "cs:IsDrinking:isrep"
            Bool: true
          }
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Equipment {
          SocketName: "right_prop"
          PickupTrigger {
            SubObjectId: 13430801892565878085
          }
        }
      }
      Objects {
        Id: 3807918045201516918
        Name: "CoffeeServer"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 12792248877237016915
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 5891176378766425696
          }
        }
      }
      Objects {
        Id: 13430801892565878085
        Name: "Trigger"
        Transform {
          Location {
            X: 11.203083
            Y: 0.662597656
          }
          Rotation {
          }
          Scale {
            X: 0.658713698
            Y: 0.658713698
            Z: 0.658713698
          }
        }
        ParentId: 12792248877237016915
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Trigger {
          Interactable: true
          InteractionLabel: "Take Coffee"
          TeamSettings {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          TriggerShape_v2 {
            Value: "mc:etriggershape:sphere"
          }
        }
      }
      Objects {
        Id: 9995370169798204568
        Name: "ClientContext"
        Transform {
          Location {
            X: 13.3318348
            Z: -11.8722687
          }
          Rotation {
            Yaw: 14.9510546
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 12792248877237016915
        ChildIds: 12663900107958840964
        ChildIds: 2811473446810269154
        ChildIds: 13116904624908501567
        UnregisteredParameters {
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        NetworkContext {
        }
      }
      Objects {
        Id: 12663900107958840964
        Name: "CoffeeClient"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9995370169798204568
        UnregisteredParameters {
          Overrides {
            Name: "cs:IKRoot"
            ObjectReference {
              SubObjectId: 2811473446810269154
            }
          }
          Overrides {
            Name: "cs:IKAnchor"
            ObjectReference {
              SubObjectId: 16114976672666944774
            }
          }
          Overrides {
            Name: "cs:SlurpSound"
            ObjectReference {
              SubObjectId: 16488179709201941395
            }
          }
          Overrides {
            Name: "cs:GulpSound"
            ObjectReference {
              SubObjectId: 7454797947902561188
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 6072154542250147306
          }
        }
      }
      Objects {
        Id: 2811473446810269154
        Name: "IK Root"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9995370169798204568
        ChildIds: 16114976672666944774
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsGroup: true
        }
      }
      Objects {
        Id: 16114976672666944774
        Name: "IK Anchor"
        Transform {
          Location {
            X: 17.3905201
            Y: 23.7475357
            Z: -12.0315638
          }
          Rotation {
            Pitch: 47.6064491
            Yaw: -70.3889465
            Roll: -64.1994629
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 2811473446810269154
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        IKAnchor {
          AimOffset {
            X: -20
          }
          IKAnchorType {
            Value: "mc:eikanchortype:righthand"
          }
          BlendWeight: 1
          BlendInTime: 0.35
          BlendOutTime: 0.3
        }
      }
      Objects {
        Id: 13116904624908501567
        Name: "Mug"
        Transform {
          Location {
            X: 1.22857153
            Y: -0.310184956
            Z: 4.86639404
          }
          Rotation {
            Yaw: 2.29775786
          }
          Scale {
            X: 0.733694196
            Y: 0.733694196
            Z: 0.733694196
          }
        }
        ParentId: 9995370169798204568
        ChildIds: 16488179709201941395
        ChildIds: 7454797947902561188
        ChildIds: 11022730269004296577
        ChildIds: 16726223082941001264
        ChildIds: 2422542056155193740
        ChildIds: 12883390578701416651
        ChildIds: 4337401523002585598
        ChildIds: 15506729897157544479
        ChildIds: 8054419402283007406
        ChildIds: 17715691808317359567
        ChildIds: 1597436461934421548
        ChildIds: 16605396278658143070
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Folder {
          IsGroup: true
        }
      }
      Objects {
        Id: 16488179709201941395
        Name: "Drink Liquid Slurp 01 SFX"
        Transform {
          Location {
            X: 0.0927106962
            Y: -0.38135469
            Z: 32.3015327
          }
          Rotation {
            Yaw: -17.2488403
          }
          Scale {
            X: 1.36296523
            Y: 1.36296523
            Z: 1.36296523
          }
        }
        ParentId: 13116904624908501567
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        AudioInstance {
          AudioAsset {
            Id: 3001107550534081909
          }
          Volume: 0.25
          Falloff: 2000
          Radius: 100
          IsSpatializationEnabled: true
          IsAttenuationEnabled: true
        }
      }
      Objects {
        Id: 7454797947902561188
        Name: "Drink Liquid Gulp Swallow 01 SFX"
        Transform {
          Location {
            X: 0.0927107111
            Y: -0.38135463
            Z: 32.3015327
          }
          Rotation {
            Yaw: -17.2488537
          }
          Scale {
            X: 1.36296558
            Y: 1.36296558
            Z: 1.36296558
          }
        }
        ParentId: 13116904624908501567
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        AudioInstance {
          AudioAsset {
            Id: 12404334582836212876
          }
          Volume: 0.35
          Falloff: 2000
          Radius: 100
          IsSpatializationEnabled: true
          IsAttenuationEnabled: true
        }
      }
      Objects {
        Id: 11022730269004296577
        Name: "Quarter hemisphere"
        Transform {
          Location {
          }
          Rotation {
            Roll: -179.999985
          }
          Scale {
            X: 0.225586519
            Y: 0.225586444
            Z: 0.0595514402
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 15377096960086681777
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceon"
        }
        CoreMesh {
          MeshAsset {
            Id: 9252237415728349118
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 16726223082941001264
        Name: "Quarter hemisphere"
        Transform {
          Location {
          }
          Rotation {
            Pitch: 1.36603776e-05
            Yaw: -89.9999695
            Roll: 180
          }
          Scale {
            X: 0.225586519
            Y: 0.225586444
            Z: 0.0595514402
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 15377096960086681777
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceon"
        }
        CoreMesh {
          MeshAsset {
            Id: 9252237415728349118
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 2422542056155193740
        Name: "Quarter hemisphere"
        Transform {
          Location {
          }
          Rotation {
            Yaw: 89.9999313
            Roll: 180
          }
          Scale {
            X: 0.225586519
            Y: 0.225586444
            Z: 0.0595514402
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 15377096960086681777
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceon"
        }
        CoreMesh {
          MeshAsset {
            Id: 9252237415728349118
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 12883390578701416651
        Name: "Quarter hemisphere"
        Transform {
          Location {
          }
          Rotation {
            Yaw: -179.999969
            Roll: 179.999985
          }
          Scale {
            X: 0.225586519
            Y: 0.225586444
            Z: 0.0595514402
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 15377096960086681777
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceon"
        }
        CoreMesh {
          MeshAsset {
            Id: 9252237415728349118
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 4337401523002585598
        Name: "Pipe - Half Thin"
        Transform {
          Location {
            X: -0.0915893912
            Y: -0.140771091
            Z: 0.00485347398
          }
          Rotation {
            Yaw: 179.999985
          }
          Scale {
            X: 0.225586519
            Y: 0.225586519
            Z: 0.225586519
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 15377096960086681777
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceon"
        }
        CoreMesh {
          MeshAsset {
            Id: 11697992987182085165
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 15506729897157544479
        Name: "Pipe - Half Thin"
        Transform {
          Location {
            X: -0.0915893912
            Y: -0.140771091
            Z: 0.00485347398
          }
          Rotation {
            Roll: 2.73207461e-05
          }
          Scale {
            X: 0.225586519
            Y: 0.225586519
            Z: 0.225586519
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 15377096960086681777
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceon"
        }
        CoreMesh {
          MeshAsset {
            Id: 11697992987182085165
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 8054419402283007406
        Name: "Pipe - 90-Degree Long Thin"
        Transform {
          Location {
            X: -11.4275646
            Y: -0.205378592
            Z: 17.2830601
          }
          Rotation {
            Pitch: -90
            Yaw: -18.4349365
            Roll: -161.565033
          }
          Scale {
            X: 0.0306773987
            Y: 0.0306773968
            Z: 0.0400451757
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 15377096960086681777
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceon"
        }
        CoreMesh {
          MeshAsset {
            Id: 14965176493963861298
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 17715691808317359567
        Name: "Pipe - 90-Degree Long Thin"
        Transform {
          Location {
            X: -19.4103947
            Y: -0.205382317
            Z: 11.152792
          }
          Rotation {
            Roll: -179.999985
          }
          Scale {
            X: 0.04
            Y: 0.030677408
            Z: 0.03067738
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 15377096960086681777
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceon"
        }
        CoreMesh {
          MeshAsset {
            Id: 14965176493963861298
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 1597436461934421548
        Name: "Cylinder"
        Transform {
          Location {
            X: 0.0123330979
            Y: -0.072689034
            Z: 15.2075949
          }
          Rotation {
            Yaw: 179.999954
            Roll: 2.73207461e-05
          }
          Scale {
            X: 0.217084989
            Y: 0.217084989
            Z: 0.0125709558
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 14232399330662554938
            }
          }
          Overrides {
            Name: "ma:Shared_BaseMaterial:color"
            Color {
              R: 0.0199999809
              G: 0.00556290802
              A: 1
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceon"
        }
        CoreMesh {
          MeshAsset {
            Id: 17164668289428711060
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          InteractWithTriggers: true
          StaticMesh {
            Physics {
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 16605396278658143070
        Name: "Steam Volume VFX"
        Transform {
          Location {
            Z: 20.9713745
          }
          Rotation {
          }
          Scale {
            X: 0.134911
            Y: 0.134911
            Z: 0.134911
          }
        }
        ParentId: 13116904624908501567
        UnregisteredParameters {
          Overrides {
            Name: "bp:Particle Scale Multiplier"
            Float: 0.1
          }
          Overrides {
            Name: "bp:Gravity"
            Float: 0.5
          }
          Overrides {
            Name: "bp:Volume Type"
            Enum {
              Value: "mc:evfxvolumetype:1"
            }
          }
          Overrides {
            Name: "bp:Color"
            Color {
              R: 1
              G: 1
              B: 1
              A: 0.7
            }
          }
          Overrides {
            Name: "bp:Density"
            Float: 0.5
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Blueprint {
          BlueprintAsset {
            Id: 13105350100751157865
          }
          TeamSettings {
          }
          Vfx {
            AutoPlay: true
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
      }
    }
    Assets {
      Id: 3001107550534081909
      Name: "Drink Liquid Slurp 01 SFX"
      PlatformAssetType: 7
      PrimaryAsset {
        AssetType: "AudioAssetRef"
        AssetId: "sfx_drink_slurp_01a_Cue_ref"
      }
    }
    Assets {
      Id: 12404334582836212876
      Name: "Drink Liquid Gulp Swallow 01 SFX"
      PlatformAssetType: 7
      PrimaryAsset {
        AssetType: "AudioAssetRef"
        AssetId: "sfx_drink_gulp_swallow_01a_Cue_ref"
      }
    }
    Assets {
      Id: 9252237415728349118
      Name: "Sphere - Half Quarter"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_quarter_hemisphere_001"
      }
    }
    Assets {
      Id: 15377096960086681777
      Name: "Marble Basic 01"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_gen_marble_tiles_001_uv"
      }
    }
    Assets {
      Id: 11697992987182085165
      Name: "Pipe - Half Thin"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_half-pipe_002"
      }
    }
    Assets {
      Id: 14965176493963861298
      Name: "Pipe - 90-Degree Long Thin"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_pipe_curve90_006"
      }
    }
    Assets {
      Id: 17164668289428711060
      Name: "Cylinder"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cylinder_002"
      }
    }
    Assets {
      Id: 14232399330662554938
      Name: "Basic Material"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_basic_pbr_material_001"
      }
    }
    Assets {
      Id: 13105350100751157865
      Name: "Steam Volume VFX"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_steam_volume_vfx"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 101
}
