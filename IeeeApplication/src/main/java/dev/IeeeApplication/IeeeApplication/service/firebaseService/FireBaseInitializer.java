/*package dev.IeeeApplication.IeeeApplication.service.firebaseService;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import jakarta.annotation.PostConstruct;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.InputStream;

@Service
public class FireBaseInitializer {
    @PostConstruct

    public void initialize() {

        try {
            //connecting the code with firebase admin file
            // we used class path ressources
            InputStream serviceAccount = new ClassPathResource("ieee-isims-app-firebase-adminsdk-p4646-ee76650de6.json").getInputStream();

            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .setDatabaseUrl("https://ieee-isims-app-default-rtdb.firebaseio.com/")
                    .build();

            FirebaseApp.initializeApp(options);

        } catch (Exception e) {
            e.printStackTrace();

        }

    }

}
*/