let id = "pete-noire-12-joints"
let name = "12 Joints by Pete Noire"

let authors = ["YourUsername"]
let version = "1.0.0"

let instructions = "Upload your custom textures to map them onto Pete Noire's 12-jointed articulation template."

// The cut-and-fold blueprint outlines for the jointed parts
let images: array<Generator.imageDef> = [
  {id: "joint-blueprint", url: require("./images/JointBlueprint.png")},
]

// The texture sheet the user uploads to color the joints
let textures: array<Generator.textureDef> = [
  {
    id: "joint-skin",
    url: require("./textures/DefaultSkin.png"), // Default color sheet fallback
    standardWidth: 128, // Adjusted larger for complex joint sheets
    standardHeight: 128,
  },
]

// Logic to draw the custom textures onto the jointed pieces
let script = () => {
  // 1. Reset the template page canvas
  Generator.clearPage()

  // 2. Draw the background fold lines and joint layouts
  Generator.drawImage("joint-blueprint", (0, 0))

  // 3. Map your texture sections to the specific joint parts
  // Format: Generator.drawTexture("texture-id", (srcX, srcY, srcW, srcH), (destX, destY, destW, destH))
  
  // Example: Mapping Texture Room to Joint #1 Main Body
  Generator.drawTexture(
    "joint-skin",
    (0, 0, 16, 16),      // Coordinates on the uploaded texture
    (150, 200, 64, 64)   // Destination spot on the printed sheet
  )

  // Example: Mapping Texture Room to Joint #2 Connector
  Generator.drawTexture(
    "joint-skin",
    (16, 0, 8, 16),      
    (220, 200, 32, 64)   
  )
}

let generator: Generator.generatorDef = {
  id: id,
  name: name,
  history: [],
  thumbnail: None,
  video: None,
  instructions: Some(<Generator.Markdown> {instructions} </Generator.Markdown>),
  images: images,
  textures: textures,
  script: script,
}
