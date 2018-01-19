module RPG
end

class RPG::Map
  attr_accessor :display_name
  attr_accessor :tileset_id
  attr_accessor :width
  attr_accessor :height
  attr_accessor :scroll_type
  attr_accessor :specify_battleback
  attr_accessor :battleback1_name
  attr_accessor :battleback2_name
  attr_accessor :autoplay_bgm
  attr_accessor :bgm
  attr_accessor :autoplay_bgs
  attr_accessor :bgs
  attr_accessor :disable_dashing
  attr_accessor :encounter_list
  attr_accessor :encounter_step
  attr_accessor :parallax_name
  attr_accessor :parallax_loop_x
  attr_accessor :parallax_loop_y
  attr_accessor :parallax_sx
  attr_accessor :parallax_sy
  attr_accessor :parallax_show
  attr_accessor :note
  attr_accessor :data
  attr_accessor :events
end



class RPG::Map::Encounter
  attr_accessor :troop_id
  attr_accessor :weight
  attr_accessor :region_set
end

class RPG::MapInfo
  attr_accessor :name
  attr_accessor :parent_id
  attr_accessor :order
  attr_accessor :expanded
  attr_accessor :scroll_x
  attr_accessor :scroll_y
end

class RPG::Event
  attr_accessor :id
  attr_accessor :name
  attr_accessor :x
  attr_accessor :y
  attr_accessor :pages
end

class RPG::Event::Page
  attr_accessor :condition
  attr_accessor :graphic
  attr_accessor :move_type
  attr_accessor :move_speed
  attr_accessor :move_frequency
  attr_accessor :move_route
  attr_accessor :walk_anime
  attr_accessor :step_anime
  attr_accessor :direction_fix
  attr_accessor :through
  attr_accessor :priority_type
  attr_accessor :trigger
  attr_accessor :list
end

class RPG::Event::Page::Condition
  attr_accessor :switch1_valid
  attr_accessor :switch2_valid
  attr_accessor :variable_valid
  attr_accessor :self_switch_valid
  attr_accessor :item_valid
  attr_accessor :actor_valid
  attr_accessor :switch1_id
  attr_accessor :switch2_id
  attr_accessor :variable_id
  attr_accessor :variable_value
  attr_accessor :self_switch_ch
  attr_accessor :item_id
  attr_accessor :actor_id
end

class RPG::Event::Page::Graphic
  attr_accessor :tile_id
  attr_accessor :character_name
  attr_accessor :character_index
  attr_accessor :direction
  attr_accessor :pattern
end

class RPG::EventCommand
  attr_accessor :code
  attr_accessor :indent
  attr_accessor :parameters
end

class RPG::MoveRoute
  attr_accessor :repeat
  attr_accessor :skippable
  attr_accessor :wait
  attr_accessor :list
end

class RPG::MoveCommand
  attr_accessor :code
  attr_accessor :parameters
end

class RPG::BaseItem
  attr_accessor :id
  attr_accessor :name
  attr_accessor :icon_index
  attr_accessor :description
  attr_accessor :features
  attr_accessor :note
end


class RPG::Class < RPG::BaseItem
  attr_accessor :exp_params
  attr_accessor :params
  attr_accessor :learnings
end


class RPG::Class::Learning
  attr_accessor :level
  attr_accessor :skill_id
  attr_accessor :note
end



class RPG::Actor < RPG::BaseItem
  attr_accessor :nickname
  attr_accessor :class_id
  attr_accessor :initial_level
  attr_accessor :max_level
  attr_accessor :character_name
  attr_accessor :character_index
  attr_accessor :face_name
  attr_accessor :face_index
  attr_accessor :equips
end

class RPG::UsableItem < RPG::BaseItem
  attr_accessor :scope
  attr_accessor :occasion
  attr_accessor :speed
  attr_accessor :animation_id
  attr_accessor :success_rate
  attr_accessor :repeats
  attr_accessor :tp_gain
  attr_accessor :hit_type
  attr_accessor :damage
  attr_accessor :effects
end

class RPG::Skill < RPG::UsableItem
  attr_accessor :stype_id
  attr_accessor :mp_cost
  attr_accessor :tp_cost
  attr_accessor :message1
  attr_accessor :message2
  attr_accessor :required_wtype_id1
  attr_accessor :required_wtype_id2
end

class RPG::Item < RPG::UsableItem
  attr_accessor :itype_id
  attr_accessor :price
  attr_accessor :consumable
end

class RPG::EquipItem < RPG::BaseItem
  attr_accessor :price
  attr_accessor :etype_id
  attr_accessor :params
end

class RPG::Weapon < RPG::EquipItem
  attr_accessor :wtype_id
  attr_accessor :animation_id
end

class RPG::Armor < RPG::EquipItem
  attr_accessor :atype_id
end

class RPG::Enemy < RPG::BaseItem
  attr_accessor :battler_name
  attr_accessor :battler_hue
  attr_accessor :params
  attr_accessor :exp
  attr_accessor :gold
  attr_accessor :drop_items
  attr_accessor :actions
end

class RPG::State < RPG::BaseItem
  attr_accessor :restriction
  attr_accessor :priority
  attr_accessor :remove_at_battle_end
  attr_accessor :remove_by_restriction
  attr_accessor :auto_removal_timing
  attr_accessor :min_turns
  attr_accessor :max_turns
  attr_accessor :remove_by_damage
  attr_accessor :chance_by_damage
  attr_accessor :remove_by_walking
  attr_accessor :steps_to_remove
  attr_accessor :message1
  attr_accessor :message2
  attr_accessor :message3
  attr_accessor :message4
end

class RPG::BaseItem::Feature
  attr_accessor :code
  attr_accessor :data_id
  attr_accessor :value
end

class RPG::UsableItem::Damage
  attr_accessor :type
  attr_accessor :element_id
  attr_accessor :formula
  attr_accessor :variance
  attr_accessor :critical
end

class RPG::UsableItem::Effect
  attr_accessor :code
  attr_accessor :data_id
  attr_accessor :value1
  attr_accessor :value2
end

class RPG::Enemy::DropItem
  attr_accessor :kind
  attr_accessor :data_id
  attr_accessor :denominator
end

class RPG::Enemy::Action
  attr_accessor :skill_id
  attr_accessor :condition_type
  attr_accessor :condition_param1
  attr_accessor :condition_param2
  attr_accessor :rating
end

class RPG::Troop
  attr_accessor :id
  attr_accessor :name
  attr_accessor :members
  attr_accessor :pages
end

class RPG::Troop::Member
  attr_accessor :enemy_id
  attr_accessor :x
  attr_accessor :y
  attr_accessor :hidden
end

class RPG::Troop::Page
  attr_accessor :condition
  attr_accessor :span
  attr_accessor :list
end

class RPG::Troop::Page::Condition
  attr_accessor :turn_ending
  attr_accessor :turn_valid
  attr_accessor :enemy_valid
  attr_accessor :actor_valid
  attr_accessor :switch_valid
  attr_accessor :turn_a
  attr_accessor :turn_b
  attr_accessor :enemy_index
  attr_accessor :enemy_hp
  attr_accessor :actor_id
  attr_accessor :actor_hp
  attr_accessor :switch_id
end

class RPG::Animation
  attr_accessor :id
  attr_accessor :name
  attr_accessor :animation1_name
  attr_accessor :animation1_hue
  attr_accessor :animation2_name
  attr_accessor :animation2_hue
  attr_accessor :position
  attr_accessor :frame_max
  attr_accessor :frames
  attr_accessor :timings
end

class RPG::Animation::Frame
  attr_accessor :cell_max
  attr_accessor :cell_data
end

class RPG::Animation::Timing
  attr_accessor :frame
  attr_accessor :se
  attr_accessor :flash_scope
  attr_accessor :flash_color
  attr_accessor :flash_duration
end

class RPG::Tileset
  attr_accessor :id
  attr_accessor :mode
  attr_accessor :name
  attr_accessor :tileset_names
  attr_accessor :flags
  attr_accessor :note
end

class RPG::CommonEvent
  attr_accessor :id
  attr_accessor :name
  attr_accessor :trigger
  attr_accessor :switch_id
  attr_accessor :list
end

class RPG::System
  attr_accessor :game_title
  attr_accessor :version_id
  attr_accessor :japanese
  attr_accessor :party_members
  attr_accessor :currency_unit
  attr_accessor :skill_types
  attr_accessor :weapon_types
  attr_accessor :armor_types
  attr_accessor :elements
  attr_accessor :switches
  attr_accessor :variables
  attr_accessor :boat
  attr_accessor :ship
  attr_accessor :airship
  attr_accessor :title1_name
  attr_accessor :title2_name
  attr_accessor :opt_draw_title
  attr_accessor :opt_use_midi
  attr_accessor :opt_transparent
  attr_accessor :opt_followers
  attr_accessor :opt_slip_death
  attr_accessor :opt_floor_death
  attr_accessor :opt_display_tp
  attr_accessor :opt_extra_exp
  attr_accessor :window_tone
  attr_accessor :title_bgm
  attr_accessor :battle_bgm
  attr_accessor :battle_end_me
  attr_accessor :gameover_me
  attr_accessor :sounds
  attr_accessor :test_battlers
  attr_accessor :test_troop_id
  attr_accessor :start_map_id
  attr_accessor :start_x
  attr_accessor :start_y
  attr_accessor :terms
  attr_accessor :battleback1_name
  attr_accessor :battleback2_name
  attr_accessor :battler_name
  attr_accessor :battler_hue
  attr_accessor :edit_map_id
end

class RPG::System::Vehicle
  attr_accessor :character_name
  attr_accessor :character_index
  attr_accessor :bgm
  attr_accessor :start_map_id
  attr_accessor :start_x
  attr_accessor :start_y
end

class RPG::System::Terms
  attr_accessor :basic
  attr_accessor :params
  attr_accessor :etypes
  attr_accessor :commands
end

class RPG::System::TestBattler
  attr_accessor :actor_id
  attr_accessor :level
  attr_accessor :equips
end

class RPG::AudioFile
  attr_accessor :name
  attr_accessor :volume
  attr_accessor :pitch
end

class RPG::BGM < RPG::AudioFile
  attr_accessor :pos
end

class RPG::BGS < RPG::AudioFile
  attr_accessor :pos
end

class RPG::ME < RPG::AudioFile
end

class RPG::SE < RPG::AudioFile
end

class Bitmap
  attr_accessor :font
end

class Clr
  attr_accessor :red
  attr_accessor :green
  attr_accessor :blue
end

class Color < Clr
  attr_accessor :alpha

  private
  def self._load(array)
    red, green, blue, alpha = array.unpack('d4')
    self
  end

end

class Tone < Clr
  attr_accessor :gray

  private
  def self._load(array)
    red, green, blue, gray = array.unpack('d4')
    self
  end

end

class Font
  attr_accessor :name
  attr_accessor :size
  attr_accessor :bold
  attr_accessor :italic
  attr_accessor :outline
  attr_accessor :shadow
  attr_accessor :color
  attr_accessor :out_color
end

class Rect
  attr_accessor :x
  attr_accessor :y
  attr_accessor :width
  attr_accessor :height
end

class Plane
  attr_accessor :bitmap
  attr_accessor :viewport
  attr_accessor :visible
  attr_accessor :z
  attr_accessor :ox
  attr_accessor :oy
  attr_accessor :zoom_x
  attr_accessor :zoom_y
  attr_accessor :opacity
  attr_accessor :blend_type
  attr_accessor :color
  attr_accessor :tone
end

class Sprite < Plane
  attr_accessor :src_rect
  attr_accessor :angle
  attr_accessor :wave_amp
  attr_accessor :wave_length
  attr_accessor :wave_speed
  attr_accessor :wave_phase
  attr_accessor :bush_depth
  attr_accessor :bush_opacity
end

class Table
  attr_accessor :xsize
  attr_accessor :ysize
  attr_accessor :zsize
  attr_accessor :data

  private
  def self._load(array)
    _, xsize, ysize, zsize, _, *data = array.unpack('LLLLLS*')
    self
  end

end

class Tilemap
  attr_accessor :bitmaps
  attr_accessor :map_data
  attr_accessor :flash_data
  attr_accessor :flags
  attr_accessor :viewport
  attr_accessor :visible
  attr_accessor :ox
  attr_accessor :oy
end

class Viewport
  attr_accessor :rect
  attr_accessor :visible
  attr_accessor :z
  attr_accessor :ox
  attr_accessor :oy
  attr_accessor :color
end

class Window
  attr_accessor :windowskin
  attr_accessor :contents
  attr_accessor :cursor_rect
  attr_accessor :viewport
  attr_accessor :active
  attr_accessor :visible
  attr_accessor :arrows_visible
  attr_accessor :pause
  attr_accessor :x
  attr_accessor :y
  attr_accessor :width
  attr_accessor :height
  attr_accessor :z
  attr_accessor :ox
  attr_accessor :oy
  attr_accessor :padding
  attr_accessor :padding_bottom
  attr_accessor :opacity
  attr_accessor :back_opacity
  attr_accessor :contents_opacity
  attr_accessor :openness
  attr_accessor :tone
end
