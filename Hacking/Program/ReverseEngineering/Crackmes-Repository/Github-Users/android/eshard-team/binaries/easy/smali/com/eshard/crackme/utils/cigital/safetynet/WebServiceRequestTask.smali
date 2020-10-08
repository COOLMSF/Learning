.class public Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;
.super Landroid/os/AsyncTask;
.source "WebServiceRequestTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Landroid/content/Context;",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field protected callback:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;

.field protected uri:Ljava/lang/String;

.field protected wrapper:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 27
    check-cast p1, [Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->doInBackground([Landroid/content/Context;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Landroid/content/Context;)Ljava/lang/Void;
    .locals 24
    .param p1, "args"    # [Landroid/content/Context;

    .prologue
    .line 76
    new-instance v5, Ljava/net/CookieManager;

    invoke-direct {v5}, Ljava/net/CookieManager;-><init>()V

    .line 77
    .local v5, "cookieManager":Ljava/net/CookieManager;
    invoke-static {v5}, Ljava/net/CookieHandler;->setDefault(Ljava/net/CookieHandler;)V

    .line 80
    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x1

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    const/16 v23, 0x0

    aput-object v23, v21, v22

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishProgress([Ljava/lang/Object;)V

    .line 83
    const/4 v14, 0x0

    .line 85
    .local v14, "queryUrl":Ljava/net/URL;
    :try_start_0
    new-instance v15, Ljava/net/URL;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->uri:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "/api/getnonce"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-direct {v15, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .end local v14    # "queryUrl":Ljava/net/URL;
    .local v15, "queryUrl":Ljava/net/URL;
    :try_start_1
    invoke-virtual {v15}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 99
    .local v4, "connection":Ljava/net/HttpURLConnection;
    :try_start_2
    const-string v21, "GET"

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/net/ProtocolException; {:try_start_2 .. :try_end_2} :catch_2

    .line 104
    const-string v21, "Content-length"

    const-string v22, "0"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v4, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    :try_start_3
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->connect()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 114
    :try_start_4
    new-instance v16, Ljava/io/BufferedReader;

    new-instance v21, Ljava/io/InputStreamReader;

    .line 115
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 116
    .local v16, "reader":Ljava/io/BufferedReader;
    invoke-virtual/range {v16 .. v16}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    move-result-object v18

    .line 121
    .local v18, "responseData":Ljava/lang/String;
    const/16 v21, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v10

    .line 122
    .local v10, "nonce":[B
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishMessage(Ljava/lang/String;)V

    .line 127
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->wrapper:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aget-object v22, p1, v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v10}, Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;->getJws(Landroid/content/Context;[B)Ljava/lang/String;

    move-result-object v8

    .line 130
    .local v8, "jws":Ljava/lang/String;
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishMessage(Ljava/lang/String;)V
    :try_end_5
    .catch Lcom/eshard/crackme/exceptions/GAPIClientFailedException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Lcom/eshard/crackme/exceptions/AttestationFailedException; {:try_start_5 .. :try_end_5} :catch_6

    .line 142
    :try_start_6
    new-instance v14, Ljava/net/URL;

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->uri:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "/api/getgift"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-direct {v14, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_7

    .line 148
    .end local v15    # "queryUrl":Ljava/net/URL;
    .restart local v14    # "queryUrl":Ljava/net/URL;
    :try_start_7
    invoke-virtual {v14}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    .end local v4    # "connection":Ljava/net/HttpURLConnection;
    check-cast v4, Ljava/net/HttpURLConnection;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_8

    .line 156
    .restart local v4    # "connection":Ljava/net/HttpURLConnection;
    :try_start_8
    const-string v21, "POST"

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/net/ProtocolException; {:try_start_8 .. :try_end_8} :catch_9

    .line 161
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 162
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 163
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 166
    new-instance v21, Landroid/net/Uri$Builder;

    invoke-direct/range {v21 .. v21}, Landroid/net/Uri$Builder;-><init>()V

    const-string v22, "jws"

    .line 167
    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v12

    .line 170
    .local v12, "postBuilder":Landroid/net/Uri$Builder;
    invoke-virtual {v12}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v13

    .line 173
    .local v13, "queryString":Ljava/lang/String;
    const/4 v11, 0x0

    .line 175
    .local v11, "os":Ljava/io/OutputStream;
    :try_start_9
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    .line 176
    new-instance v20, Ljava/io/BufferedWriter;

    new-instance v21, Ljava/io/OutputStreamWriter;

    const-string v22, "UTF-8"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v11, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct/range {v20 .. v21}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 177
    .local v20, "writer":Ljava/io/BufferedWriter;
    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 178
    invoke-virtual/range {v20 .. v20}, Ljava/io/BufferedWriter;->flush()V

    .line 179
    invoke-virtual/range {v20 .. v20}, Ljava/io/BufferedWriter;->close()V

    .line 180
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_a

    .line 188
    :try_start_a
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->connect()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_b

    .line 196
    :try_start_b
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v21

    const/16 v22, 0x1f4

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_1

    .line 201
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v7

    .line 202
    .local v7, "in":Ljava/io/InputStream;
    const-string v19, ""

    .line 203
    .local v19, "result":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 204
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v21, Ljava/io/InputStreamReader;

    move-object/from16 v0, v21

    invoke-direct {v0, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v21

    invoke-direct {v3, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 205
    .local v3, "bufferedReader":Ljava/io/BufferedReader;
    const-string v9, ""

    .line 207
    .local v9, "line":Ljava/lang/String;
    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_0

    .line 208
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_c

    move-result-object v19

    goto :goto_0

    .line 86
    .end local v3    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v4    # "connection":Ljava/net/HttpURLConnection;
    .end local v7    # "in":Ljava/io/InputStream;
    .end local v8    # "jws":Ljava/lang/String;
    .end local v9    # "line":Ljava/lang/String;
    .end local v10    # "nonce":[B
    .end local v11    # "os":Ljava/io/OutputStream;
    .end local v12    # "postBuilder":Landroid/net/Uri$Builder;
    .end local v13    # "queryString":Ljava/lang/String;
    .end local v16    # "reader":Ljava/io/BufferedReader;
    .end local v18    # "responseData":Ljava/lang/String;
    .end local v19    # "result":Ljava/lang/String;
    .end local v20    # "writer":Ljava/io/BufferedWriter;
    :catch_0
    move-exception v6

    .line 87
    .local v6, "e":Ljava/net/MalformedURLException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->runtimeError(Ljava/lang/Exception;)V

    .line 88
    const/16 v21, 0x0

    .line 237
    .end local v6    # "e":Ljava/net/MalformedURLException;
    :goto_1
    return-object v21

    .line 94
    .end local v14    # "queryUrl":Ljava/net/URL;
    .restart local v15    # "queryUrl":Ljava/net/URL;
    :catch_1
    move-exception v6

    .line 95
    .local v6, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->noWebService(Ljava/lang/Exception;)V

    .line 96
    const/16 v21, 0x0

    move-object v14, v15

    .end local v15    # "queryUrl":Ljava/net/URL;
    .restart local v14    # "queryUrl":Ljava/net/URL;
    goto :goto_1

    .line 100
    .end local v6    # "e":Ljava/io/IOException;
    .end local v14    # "queryUrl":Ljava/net/URL;
    .restart local v4    # "connection":Ljava/net/HttpURLConnection;
    .restart local v15    # "queryUrl":Ljava/net/URL;
    :catch_2
    move-exception v6

    .line 101
    .local v6, "e":Ljava/net/ProtocolException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->runtimeError(Ljava/lang/Exception;)V

    .line 102
    const/16 v21, 0x0

    move-object v14, v15

    .end local v15    # "queryUrl":Ljava/net/URL;
    .restart local v14    # "queryUrl":Ljava/net/URL;
    goto :goto_1

    .line 107
    .end local v6    # "e":Ljava/net/ProtocolException;
    .end local v14    # "queryUrl":Ljava/net/URL;
    .restart local v15    # "queryUrl":Ljava/net/URL;
    :catch_3
    move-exception v6

    .line 108
    .local v6, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->noWebService(Ljava/lang/Exception;)V

    .line 109
    const/16 v21, 0x0

    move-object v14, v15

    .end local v15    # "queryUrl":Ljava/net/URL;
    .restart local v14    # "queryUrl":Ljava/net/URL;
    goto :goto_1

    .line 117
    .end local v6    # "e":Ljava/io/IOException;
    .end local v14    # "queryUrl":Ljava/net/URL;
    .restart local v15    # "queryUrl":Ljava/net/URL;
    :catch_4
    move-exception v6

    .line 118
    .restart local v6    # "e":Ljava/io/IOException;
    const-string v21, "failed to retrieve nonce."

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v6, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishError(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 119
    const/16 v21, 0x0

    move-object v14, v15

    .end local v15    # "queryUrl":Ljava/net/URL;
    .restart local v14    # "queryUrl":Ljava/net/URL;
    goto :goto_1

    .line 131
    .end local v6    # "e":Ljava/io/IOException;
    .end local v14    # "queryUrl":Ljava/net/URL;
    .restart local v10    # "nonce":[B
    .restart local v15    # "queryUrl":Ljava/net/URL;
    .restart local v16    # "reader":Ljava/io/BufferedReader;
    .restart local v18    # "responseData":Ljava/lang/String;
    :catch_5
    move-exception v6

    .line 132
    .local v6, "e":Lcom/eshard/crackme/exceptions/GAPIClientFailedException;
    const-string v21, "Google Play Services not available on the device or is out of date."

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v6, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishError(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 133
    const/16 v21, 0x0

    move-object v14, v15

    .end local v15    # "queryUrl":Ljava/net/URL;
    .restart local v14    # "queryUrl":Ljava/net/URL;
    goto :goto_1

    .line 134
    .end local v6    # "e":Lcom/eshard/crackme/exceptions/GAPIClientFailedException;
    .end local v14    # "queryUrl":Ljava/net/URL;
    .restart local v15    # "queryUrl":Ljava/net/URL;
    :catch_6
    move-exception v6

    .line 135
    .local v6, "e":Lcom/eshard/crackme/exceptions/AttestationFailedException;
    const-string v21, "failed connection to Google Play Services."

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v6, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishError(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 136
    const/16 v21, 0x0

    move-object v14, v15

    .end local v15    # "queryUrl":Ljava/net/URL;
    .restart local v14    # "queryUrl":Ljava/net/URL;
    goto :goto_1

    .line 143
    .end local v6    # "e":Lcom/eshard/crackme/exceptions/AttestationFailedException;
    .end local v14    # "queryUrl":Ljava/net/URL;
    .restart local v8    # "jws":Ljava/lang/String;
    .restart local v15    # "queryUrl":Ljava/net/URL;
    :catch_7
    move-exception v6

    .line 144
    .local v6, "e":Ljava/net/MalformedURLException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->runtimeError(Ljava/lang/Exception;)V

    .line 145
    const/16 v21, 0x0

    move-object v14, v15

    .end local v15    # "queryUrl":Ljava/net/URL;
    .restart local v14    # "queryUrl":Ljava/net/URL;
    goto :goto_1

    .line 151
    .end local v4    # "connection":Ljava/net/HttpURLConnection;
    .end local v6    # "e":Ljava/net/MalformedURLException;
    :catch_8
    move-exception v6

    .line 152
    .local v6, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->noWebService(Ljava/lang/Exception;)V

    .line 153
    const/16 v21, 0x0

    goto :goto_1

    .line 157
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v4    # "connection":Ljava/net/HttpURLConnection;
    :catch_9
    move-exception v6

    .line 158
    .local v6, "e":Ljava/net/ProtocolException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->runtimeError(Ljava/lang/Exception;)V

    .line 159
    const/16 v21, 0x0

    goto :goto_1

    .line 181
    .end local v6    # "e":Ljava/net/ProtocolException;
    .restart local v11    # "os":Ljava/io/OutputStream;
    .restart local v12    # "postBuilder":Landroid/net/Uri$Builder;
    .restart local v13    # "queryString":Ljava/lang/String;
    :catch_a
    move-exception v6

    .line 182
    .local v6, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->runtimeError(Ljava/lang/Exception;)V

    .line 183
    const/16 v21, 0x0

    goto :goto_1

    .line 189
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v20    # "writer":Ljava/io/BufferedWriter;
    :catch_b
    move-exception v6

    .line 190
    .restart local v6    # "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->noWebService(Ljava/lang/Exception;)V

    .line 191
    const/16 v21, 0x0

    goto :goto_1

    .line 212
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v7    # "in":Ljava/io/InputStream;
    .restart local v19    # "result":Ljava/lang/String;
    :cond_0
    :try_start_c
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 214
    new-instance v21, Ljava/lang/Exception;

    invoke-direct/range {v21 .. v21}, Ljava/lang/Exception;-><init>()V

    const-string v22, "API call verification failed.\r\nThis means that this device did not pass SafetyNet checks or you forgot to update digests on your server."

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishError(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 215
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 216
    .end local v7    # "in":Ljava/io/InputStream;
    .end local v19    # "result":Ljava/lang/String;
    :cond_1
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v21

    const/16 v22, 0xc8

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_2

    .line 218
    new-instance v21, Ljava/lang/Exception;

    invoke-direct/range {v21 .. v21}, Ljava/lang/Exception;-><init>()V

    const-string v22, "unknown error with the API."

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishError(Ljava/lang/Exception;Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_c

    .line 219
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 221
    :catch_c
    move-exception v6

    .line 222
    .restart local v6    # "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->runtimeError(Ljava/lang/Exception;)V

    .line 223
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 227
    .end local v6    # "e":Ljava/io/IOException;
    :cond_2
    const/16 v16, 0x0

    .line 230
    :try_start_d
    new-instance v17, Ljava/io/BufferedReader;

    new-instance v21, Ljava/io/InputStreamReader;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_d

    .line 231
    .end local v16    # "reader":Ljava/io/BufferedReader;
    .local v17, "reader":Ljava/io/BufferedReader;
    :try_start_e
    invoke-virtual/range {v17 .. v17}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v18

    .line 232
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "\r\nThis means that your device has successfully passed SafetyNet checks."

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishMessage(Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_e

    move-object/from16 v16, v17

    .line 237
    .end local v17    # "reader":Ljava/io/BufferedReader;
    .restart local v16    # "reader":Ljava/io/BufferedReader;
    :goto_2
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 233
    :catch_d
    move-exception v6

    .line 234
    .restart local v6    # "e":Ljava/io/IOException;
    :goto_3
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    .line 235
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->runtimeError(Ljava/lang/Exception;)V

    goto :goto_2

    .line 233
    .end local v6    # "e":Ljava/io/IOException;
    .end local v16    # "reader":Ljava/io/BufferedReader;
    .restart local v17    # "reader":Ljava/io/BufferedReader;
    :catch_e
    move-exception v6

    move-object/from16 v16, v17

    .end local v17    # "reader":Ljava/io/BufferedReader;
    .restart local v16    # "reader":Ljava/io/BufferedReader;
    goto :goto_3
.end method

.method protected noWebService(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 50
    const-string v0, "could not open a connection to the web service."

    invoke-virtual {p0, p1, v0}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishError(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .locals 3
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 242
    const/4 v2, 0x0

    aget-object v2, p1, v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 243
    .local v0, "code":I
    const/4 v2, 0x1

    aget-object v2, p1, v2

    check-cast v2, [Ljava/lang/String;

    move-object v1, v2

    check-cast v1, [Ljava/lang/String;

    .line 244
    .local v1, "messages":[Ljava/lang/String;
    iget-object v2, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->callback:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;

    invoke-interface {v2, v0, v1}, Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;->handleCallback(I[Ljava/lang/String;)V

    .line 245
    return-void
.end method

.method protected publishError(Ljava/lang/Exception;Ljava/lang/String;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "errorMsg"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 65
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 66
    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v2

    new-array v1, v3, [Ljava/lang/String;

    aput-object p2, v1, v2

    aput-object v1, v0, v3

    invoke-virtual {p0, v0}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishProgress([Ljava/lang/Object;)V

    .line 67
    return-void
.end method

.method protected publishMessage(Ljava/lang/String;)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 60
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    new-array v1, v2, [Ljava/lang/String;

    aput-object p1, v1, v3

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishProgress([Ljava/lang/Object;)V

    .line 61
    return-void
.end method

.method protected runtimeError(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 55
    const-string v0, "runtime error. Try again."

    invoke-virtual {p0, p1, v0}, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->publishError(Ljava/lang/Exception;Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method public setCallback(Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->callback:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper$SafetyNetCallback;

    .line 46
    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->uri:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setWrapper(Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;)V
    .locals 0
    .param p1, "wrapper"    # Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/eshard/crackme/utils/cigital/safetynet/WebServiceRequestTask;->wrapper:Lcom/eshard/crackme/utils/cigital/safetynet/SafetyNetWrapper;

    .line 41
    return-void
.end method
