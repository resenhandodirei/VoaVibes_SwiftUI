//
//  UserProfileView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI

struct UserProfileView: View {
    @State private var userName: String = "Larissa Martins"
    @State private var userInterests: [String] = ["Aventura", "Cultura", "Gastronomia", "Natureza"]
    @State private var isEditing: Bool = false
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                // Foto do usuário
                VStack {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                            .shadow(radius: 5)
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.azul)
                            .padding()
                    }
                    Button("Alterar Foto") {
                        showImagePicker = true
                    }
                    .font(.subheadline)
                    .foregroundColor(.amareloEnergizante)
                }
                .padding(.top)

                // Nome do usuário
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Nome:")
                            .foregroundColor(.azul)
                            .font(.headline)
                        if isEditing {
                            TextField("Nome do usuário", text: $userName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 8)
                        } else {
                            Text(userName)
                                .font(.body)
                        }
                    }

                    // Interesses do usuário
                    VStack(alignment: .leading) {
                        Text("Interesses:")
                            .font(.headline)
                            .foregroundColor(.azul)
                        if isEditing {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(userInterests, id: \.self) { interest in
                                        Text(interest)
                                            .padding(8)
                                            .background(Color.blue.opacity(0.2))
                                            .cornerRadius(8)
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        } else {
                            ForEach(userInterests, id: \.self) { interest in
                                Text("• \(interest)")
                                    .font(.body)
                            }
                        }
                    }
                }
                .padding()

                Spacer()

                // Botão Editar/Salvar
                Button(isEditing ? "Salvar" : "Editar Perfil") {
                    isEditing.toggle()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(isEditing ? Color.azul : Color.amareloEnergizante)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.horizontal)
            }
            .navigationTitle("Perfil do Usuário")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
}

// Image Picker para alterar a foto do perfil
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.editedImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
