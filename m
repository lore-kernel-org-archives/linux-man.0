Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191147;
	b=jCP7zt5MJCbe4tXRvVG3bbMpLblYIRKLasIjZQTpBfF0ZPPsRk55ukYE45vPufObc7Iv
	 bImJbss5+9KXVi84151AfQAQxkDVlyf8hjPiUzY3adUz0mONou/Xx7ZJKRRg/Q7oKoEoJ
	 yKb9Aygy+bbZd3iHA36rBYgQG3N3FV+X3t+XbueWKwGfSAn/q4EjrY8SAIyXAPNpl4rUN
	 ldM1oRE66K/i5FAqrkjcF9Whl1DaQQm2DwA6ww6mcb8UUrnOEGGxKtILUwoQKw87ZcPeb
	 utfsiPgew+FCUTz/rs9HZqtpUosjjWTgwPuK/IMfJxk9SWOa2MfWDBtXo2xaipy9HOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A5rGvACBcxpftIaB8IEywlO7tHzGDDR5NXCPG24pQGI=;
	b=t3K4im6S3A/R/D6k9TfMSv8ufsmHb+/AlPxUZg4qIAL39NK+kpT0uA9dVx/upRIxvx6Z
	 vvoqmasAR7dCeQ7AhXqSxT7dbdw+OVTFJSBesy3uKBlvIVTbpP46cte6fMALEv0mKBwzH
	 p6/lSZ54zq10bw5e5OeFeFfuBq2MGNAN0kIWD7w6BF6ekzZhNWlDTben6Q/rEGBNEYYoE
	 0NzBqLd0NjaYuIOdSmSBqELNBGH8Ko7FSXv9qlL4VkOkF4PA7eHlAikV1sDtHWVgLO4sN
	 0wI8ea1eCtYJvHg69IYzWHNyfT/Cefqys+3HpZZ31ZHRcogdXKvvHZLYBHr5rF25nHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zL7ig16o;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA398606A332
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 16:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA398606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zL7ig16o
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so10972675e9.0
        for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 08:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191145; x=1795795945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5rGvACBcxpftIaB8IEywlO7tHzGDDR5NXCPG24pQGI=;
        b=zL7ig16oEAE2o9/29xUlsxuUfF56QSIJScxH0YOJGLwnb7FhQjLXZSr5cxm6qIeqeB
         SVIHjv2tL2T1TpQeMR7rmsKk+EFWRu63wrQCyQK6ybj5BT9R9WJnKrLy9KgghJl78EGB
         +oXsDUIiqS1o6j9zkbOW2zlNqnOXKIDZFd3LksUzo7p2nz4Nh/l1xOGb5l+ilArCnOcE
         0bVguPXKdWIvEqMD2QFeZ3peA5XH5ntb7vMzVypDRU1WNkoF0ZRvZKMAzLkMHn0MYSJo
         /9Y/nqJml4aTqB9tivKD5e1aJ44TLOaLbPe777+WPdom2ApG/fZVlhhxK7JVOzsamsq8
         K7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191145; x=1795795945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5rGvACBcxpftIaB8IEywlO7tHzGDDR5NXCPG24pQGI=;
        b=wI+9ST1edTEkb6wMxFbVUh17zuhSkceWuSmL9g4YeVkTSogYWc+DMwXruzWTYjMyQr
         F9gi70SzvYzBrKmMbPrm20ENh9hqWwg17l1kiIqcXAufbSr/K0RnWVYuNU/3Jq+1/u/a
         E8wrPR2r/iWnvh4IEwYrXCCPH/zP0FpmCJfJqX0DwO0TeNWg7BA835Ea77cdx+pPKgWI
         /GDK2+d+zWE46J0+2jI8W1yhyqTBSkgD7zVodxp56uiFTHHvt+A1aLGhqqWD/CoNM+TS
         HHpCVxHaHqXQJ8NxGBtaFiQOURQdejrbotggeAzUTxGyRHnU/9fVp13Q47Cpwe8cIXfk
         cF0g==
X-Forwarded-Encrypted: i=1; AL+hErHuTkxoPAxkq1sAupk5r4e0jkxSf0CxkcTE/zKScOMJCWvZcQPcrymFLpwZ4DgQqml+SFfesGNHIP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P1ny5ubI9Ip8fMAAuAdEY5cGzgDs0aScUpG7AhnGwJ7/HBPao
	3RM5mv2tOIO8Np9pL84Q8rOoYACX4kOiBIjwjO6OZEIGCyvup7cECzL8
X-Gm-Gg: AYBFou1sgGwwBi32yRI7/JvbOwR0eSCR520i1uT/8rQNMbBqGbYPO3WhJVILnvGXS4j
	N+CeParF/Gluf8Lnk9Ke1ts5eNcTu4CpQTgN67ypp8y8aufi2t3zJnwlz37Kqpe2yB5f3fV4mAK
	X/9syzyEfaH1PXqVh+euESmnjieZlkmoWkWjzRXJkPnC1fgf8eJgZzo0lUEFcF34ndIvrVC9BBu
	l52xkgzckMdm2eNJXl2xbrdDupq3SZWAM5oPULVX7dnv8sqXA3+sAcXBAIwh/f/ort5yDaty55y
	aom3E2FFogOssXLXqi9cc3KnL4K6nbJuG3X5QxDGoxDK1m7436amLejOu/lpkgTx4xkAdHBhmQq
	dIZpG+snxzVZ35BjYpX3UFTHwEPdLwf4B0WqP6t98jnMFeqNIlmIU3wuOje7UIElsXTQzd2LOAm
	/TzFnjcIM04wFi7zE8N1d2XQ1edRNyeGdcBP6ur8vhDY/J457ok25T1/vVOK58zpmspIs37eSp6
	3heIL8XSW//Kj4RzJTa8Rxol4xMVYl0dWkqZpNPOmEXvt8vdA7dWbOyjYdQ55fqChuFRMXG4jCo
	DOoza+PMnwNgEsNkYfBihAT6mubPycWKHqPcUE3kQJx05JwNSmvDBg==
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr85286725e9.12.1795191144979;
        Fri, 20 Nov 2026 08:12:24 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61ddsm5922055f8f.12.2026.11.20.08.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:12:24 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH v3 1/5] man/man7/unix.7: SCM_SECURITY: Generalize to other LSMs, not just SELinux
Date: Fri, 20 Nov 2026 17:11:58 +0100
Message-ID: <20261120161202.27163-2-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120161202.27163-1-gnoack3000@gmail.com>
References: <20261120161202.27163-1-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reword the description of SCM_SECURITY to not be specific to SELinux.

The security context is populated in scm_passec() in linux.git
net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
is currently implemented by SELinux, Smack and AppArmor.

As clarified in [1], the returned security context is in the general
case a byte buffer, not a null-terminated string.  The only LSM that
returns a buffer with trailing null byte is SELinux, but even that is
not guaranteed in case that the message is truncated.

Link: [1] <https://lore.kernel.org/all/auZcwYWv0NeiIR8d@google.com/>
Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary data")
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>
Reported-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 61f06a74359b..3322d915f1bb 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -312,7 +312,7 @@ .SS Socket options
 is an integer boolean flag.
 .TP
 .B SO_PASSSEC
-Enables receiving of the SELinux security label of the peer socket
+Enables receiving of the security label of the peer socket
 in an ancillary message of type
 .B SCM_SECURITY
 (see below).
@@ -538,13 +538,19 @@ .SS Ancillary messages
 option must be enabled on the socket.
 .TP
 .B SCM_SECURITY
-Receive the SELinux security context (the security label)
-of the peer socket.
-The received ancillary data is a null-terminated string containing
-the security context.
-The receiver should allocate at least
-.B NAME_MAX
-bytes in the data portion of the ancillary message for this data.
+Receive the security context (the security label)
+of the peer socket,
+as provided by the active Linux Security Module (LSM).
+The received ancillary data is a byte buffer.
+.IP
+The exact format of the security context buffer
+is defined by the active major LSM.
+If the caller does not provide sufficient buffer space,
+the buffer is truncated in a format-unaware manner
+and
+.B MSG_CTRUNC
+is set in
+.IR msg.msg_flags .
 .IP
 To receive the security context, the
 .B SO_PASSSEC
-- 
2.56.1

