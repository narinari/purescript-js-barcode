module Graphics.JsBarcode
  ( mkJsBarcode
  , mkJsBarcodeSimple
  , module Graphics.JsBarcode.Types
  ) where

import Graphics.JsBarcode.Types (Config, JsBarcode, Format(..), defaultConfig, toString)
import CSS.Color (cssStringRGBA)
import Control.Monad.Eff (Eff)
import DOM (DOM)
import DOM.Node.Types (Element)
import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Data.Foreign (Foreign)
import Data.Foreign.Class (write)
import Data.Foreign.Undefined (Undefined(..))
import Prelude (Unit, (<<<))

type RawConfig =
  { width :: Number
	, height :: Number
	, format :: String
	, displayValue :: Boolean
	, fontOptions :: String
	, font :: String
	, text :: Foreign
	, textAlign :: String
	, textPosition :: String
	, textMargin :: Number
	, fontSize :: Number
	, background :: String
	, lineColor :: String
	, margin :: Foreign
	, marginTop :: Foreign
	, marginBottom :: Foreign
	, marginLeft :: Foreign
	, marginRight :: Foreign
  }

foreign import mkJsBarcodeImpl :: forall eff. Fn3 Element String RawConfig (Eff (dom :: DOM | eff) Unit)
foreign import mkJsBarcodeSimpleImpl :: forall eff. Fn2 Element String (Eff (dom :: DOM | eff) Unit)

mkJsBarcode :: forall eff. Element -> String -> Config -> Eff (dom :: DOM | eff) Unit
mkJsBarcode elm value =
  runFn3 mkJsBarcodeImpl elm value <<< toRawConfig
  where
  toRawConfig config =
    { width: config.width
    , height: config.height
    , format: toString config.format
    , displayValue: config.displayValue
    , fontOptions: config.fontOptions
    , font: config.font
    , text: write (Undefined config.text)
    , textAlign: config.textAlign
    , textPosition: config.textPosition
    , textMargin: config.textMargin
    , fontSize: config.fontSize
    , background: cssStringRGBA config.background
    , lineColor: cssStringRGBA config.lineColor
    , margin: write (Undefined config.margin)
    , marginTop: write (Undefined config.marginTop)
    , marginBottom: write (Undefined config.marginBottom)
    , marginLeft: write (Undefined config.marginLeft)
    , marginRight: write (Undefined config.marginRight)
    }

mkJsBarcodeSimple :: forall eff. Element -> String -> Eff (dom :: DOM | eff) Unit
mkJsBarcodeSimple = runFn2 mkJsBarcodeSimpleImpl
