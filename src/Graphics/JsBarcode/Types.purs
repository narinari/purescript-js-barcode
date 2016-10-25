module Graphics.JsBarcode.Types where

import Data.Maybe (Maybe(..))

import CSS.Color (Color, black, rgb)

data JsBarcode

data Format
  = AUTO
  | CODE128
  | CODE128A
  | CODE128B
  | CODE128C
  | EAN13
  | EAN8
  | EAN5
  | EAN2
  | UPC
  | CODE39
  | ITF14
  | MSI
  | PharmaCode

toString :: Format -> String
toString = case _ of
  AUTO -> "auto"
  CODE128 -> "code128"
  CODE128A -> "code128A"
  CODE128B -> "code128B"
  CODE128C -> "code128C"
  EAN13 -> "ean13"
  EAN8 -> "ean8"
  EAN5 -> "ean5"
  EAN2 -> "ean2"
  UPC -> "upc"
  CODE39 -> "code39"
  ITF14 -> "itf14"
  MSI -> "msi"
  PharmaCode -> "pharmacode"

type Config =
  { width :: Number
	, height :: Number
	, format :: Format
	, displayValue :: Boolean
	, fontOptions :: String
	, font :: String
	, text :: Maybe String
	, textAlign :: String
	, textPosition :: String
	, textMargin :: Number
	, fontSize :: Number
	, background :: Color
	, lineColor :: Color
	, margin :: Maybe Number
	, marginTop :: Maybe Number
	, marginBottom :: Maybe Number
	, marginLeft :: Maybe Number
	, marginRight :: Maybe Number
  }

defaultConfig :: Config
defaultConfig =
  { width: 2.0
	, height: 100.0
	, format: AUTO
	, displayValue: true
	, fontOptions: ""
	, font: "monospace"
	, text: Nothing
	, textAlign: "center"
	, textPosition: "bottom"
	, textMargin: 2.0
	, fontSize: 20.0
	, background: rgb 255 255 255
	, lineColor: black
	, margin: Just 10.0
	, marginTop: Nothing
	, marginBottom: Nothing
	, marginLeft: Nothing
	, marginRight: Nothing
  }
