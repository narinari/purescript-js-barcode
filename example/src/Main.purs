module Main where

import Graphics.JsBarcode
import CSS (rgb)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import DOM (DOM)
import DOM.Event.Types (EventType(EventType))
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToNonElementParentNode)
import DOM.HTML.Window (document)
import DOM.Node.NonElementParentNode (getElementById)
import DOM.Node.Types (ElementId(ElementId))
import Data.Either (either)
import Data.Foreign (toForeign)
import Data.Foreign.Class (read)
import Data.Maybe (Maybe(Nothing))
import Data.Nullable (toMaybe)
import Data.Traversable (sequence)
import Prelude (Unit, bind, void, pure, const, (<*>), (<$>), ($), (<<<), (=<<), (>>=))

foreign import onLoad :: forall eff. Eff eff Unit -> Eff eff Unit

clickEvent :: EventType
clickEvent = EventType "click"

main :: forall e. Eff (console :: CONSOLE, dom :: DOM | e) Unit
main = onLoad $ void $ do
  doc <- htmlDocumentToNonElementParentNode <$> (window >>= document)
  barcode1Elm <- toMaybe <$> getElementById (ElementId "barcode1") doc
  barcode2Elm <- toMaybe <$> getElementById (ElementId "barcode2") doc

  let janCode = pure "012345678912"
  sequence $ mkJsBarcodeSimple
    <$> ((eitherToMaybe <<< read <<< toForeign) =<< barcode1Elm)
    <*> janCode
  sequence $ mkJsBarcode
    <$> ((eitherToMaybe <<< read <<< toForeign) =<< barcode2Elm)
    <*> janCode
    <*> pure defaultConfig { format = EAN13, background = rgb 200 200 250 }

  where
  eitherToMaybe = either (const Nothing) pure
