
# Combine-VIPER Example

This is a proof of concept and as such there are some cases where it has been purposefully over engineered to prove that it's possible in large apps.

### TODO:
- Reuse cell modules and just update the model instead of recreting the module on dequeueReusableCell
- Do create a new module for cells when the model for the cell does not exist in the movies array yet
- If going to view detail before cell poster it fetched from network, then update the detail poster once the cell poster has been fetched
- Either show "select movie" screen or show first movie in list on the detail view when first opening app
- Pass title in from cell

An example app demonstrating VIPER architecture alongside Combine and aync/await.
The interface is UIKit although it's written in a way that allows easy upgrades to SwiftUI.

This product uses the TMDB API but is not endorsed or certified by TMDB.

![Screenshot](Combine-VIPER/Resources/Assets.xcassets/TMDBLogo.imageset/TMDBLogo.svg)

## VIPER

![Screenshot](Documentation/VIPER_Diagram.svg)

## Discoveries
- Adding a network layer into a reusable cell sub-module is not worth it. If a sub-module is necesarry then the solution is to pass in the result of the network request from the parents modules model
- Manually triggering the publishers receieve(_:) using a `Subject` is possible, although in most cases it's best to have a @Published array hold structs to avoid this problem.
