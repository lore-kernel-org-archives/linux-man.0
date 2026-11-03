Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737325;
	b=Hn3c1uLHJoFY2/6qoXU2OjZd6wK+XeS7RZ0vkOQfCb+zGWRMfHCJS/LFA8SgPQf9FM4J
	 Xz16PabbIOMxk3X8jWIsSEWKAWE2ViwbddA8sFt1JTig5/+CEHZ+mpq+sIk27vJ0ciwcr
	 4K50PSrwJxdbsx3xuMhyzwWl4huvyyRUH0pDseVXoYmzpnOSFjZQ3BzWhad3X/4vIinZI
	 49e39aZnD5V3qB4lrIlTli8LcJ6mSMly/lIOSjspYuH0UtnP7IWlxDIu4VAG5EhxSh5cE
	 82UXQeb3aG4gruRQwyuj2LWCOc0dqIKhR5896VI/7dOR6fqFllDeK3jHr17V1w57/yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=v5vpvGrZ8Dn7GFUJ68xTsBDiiO1GRwv1DlHwY1866QE=;
	b=43NCYtzTPP/XYCQHgk7IklQNNJy3Iu4yxSCFZXxpBB/xMQYJa61qtnzEVspr3J6DZkRS
	 0RwrHRh3SxRCrrhOu/BAFdJsdYXAzdo+IBYxCQ+C2qyg6p9NqjMM1h2byhoZR72k2AtIM
	 R6Akw1SOQrfele1RM8IPlniCE2CvU2zqL2VwtsZ3PKaYXQ6jqZM5R3eXYtiQfT8pYdrAf
	 c7LeFdukaod/x47Cj9lrve5K794WVQaqKJlP3o9y1ytVBUi4uXpHa0l/STEQYVDF4V7iq
	 L+2WykN8LiSkoWCA3/NrTmqmB0tAJ0CppEJFcRjBi43alEZ/0RrcE9RfsHROZH0f6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IYC8oKCl;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49329606A324
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49329606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IYC8oKCl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so31215305e9.0
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737324; x=1794342124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v5vpvGrZ8Dn7GFUJ68xTsBDiiO1GRwv1DlHwY1866QE=;
        b=IYC8oKCleSOl5iyCXnGpISgE2kn3PcPA+83w1J9sKlpBJAu3wA1IfWUIajvA5Ubfkv
         /1PUYnDI7TJWbfy2DqiE1vmJ3sEihOWzHhcPr+xpxbXCDTt4ToWQoV1aUvhQbUkX/Q+A
         KjY0myV4cfLIMclrSAqPrBbxNH42gL1rGBrPKN++a2SFiCTCmo7eynYIV/BLUbORv+DF
         BYAUpM2R1BH37/FRhJx56kXQtskDXX0ep0nO7p/7gbhwdb+Fcx3gwF1Mk2lKE5Atb49g
         QKJogr8Q3A8ekx6wE7fM0UeNkGhJz+EA3ovGDOAfiWOukm8DgkK70cpCJBsLJt3+opEE
         yJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737324; x=1794342124;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5vpvGrZ8Dn7GFUJ68xTsBDiiO1GRwv1DlHwY1866QE=;
        b=UaeKhsNCk2V4CI3b+a1c0z6shPW587zeX9qYwnyC2q3jKByBAdYGQ2RFYGZ6sT1Kae
         vnKz6m4bXxrPYLpW59OmK5M1jTah9ZB8o0AV1VIraf4BtE44R8XddkazB3HI2aShTwYb
         JMRU9ylfLF8ouG5ZsDfrT+iU0eS9xH9kkoiodbEq+yxKrqQvAU/J8Morcoc/lTl7rVAD
         +dvj/EHPPNnyDR7m2bS4znekOpSv6c5slejCXTdjX+5sRM64fs7yIr+bVxoMfLQse1Xv
         WsZTJbfcpdMxjO9HepHiz9ZxqTJY193VQl1E+z4TWYBqkiV23aIG1zOZKrsU3VatjwBu
         4uWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoKryyPIE7FEcK+WBD6TePWy6/Nm0ml5+i740SAY1yWsvXrwWEq+537kx3oMGWDLqVxBUDLK56AIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KZfCHXmOuNK+J3LSd6XARATG6LKLAI/faTSEhiQ1ppveyeh3d
	LT8NFheXXpWXXOX13NCws+uVeFyjv28vgItSRljzi/HgyqXriY/k8ma9thMKJps+
X-Gm-Gg: AYBFou3yByuv/FYjYq89y7Q9qKqHkuGYacsQjV4lB29/Fu0lwC3yxLmoNDdRpQcmyWC
	PZVMjrlKocYjL0Tdh22b09t5eQ6654r4+hg3AM9PuCcHjq+CW+CQRSqCWY0BGoQdAcYIGvtsj8Q
	rLL7b8l9BFY8X1JN4nEJVRLVXpN9ONycwcTv1EqhkRqguGCEld8yYxdFZ7ZCVSuUCUNmcVm/vZI
	Duv6/1dzZL0/y5tvx9rAOx3HCoSbwDyEek10I/Cbp/y0znvsgmnOYG5hFsXwmQdfsb0gndG1IQk
	Ea0Cy+C9JoB4p96JwDDPI8wn+6nItA9cWRCQNSNS62rTnJmKdA2vI73SQPcLBHisCL2058i86hT
	bv21zh8bOjp1oWKJ6Bf1YX2dd6IUtgfW9LOc02lkxCZV0R8hOUKjNVZKzybY2uO1UK8uVlKBSWq
	1CVrIj6s6mC2hrMeukcegFygKiiJLYVU/J7aMG1MIHJE3GwQS3H4H7tNjjfqViaZ9Ie3AXTpakH
	St60Be59rwtocgpGfVhfiXSa6F1VOJply2bjEi8SLbMWeRwMEWrEx2aJevVJyErPBl4v6xMmOqg
	5OeFfS6tpm9fMaRlDEj7DDsgx2uyjZfAu2K3VMjxAY8ORmlmfLIRpH88Afo3lxtVDW6h9IT1Ivw
	=
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr308459015e9.33.1793737323654;
        Tue, 03 Nov 2026 12:22:03 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm262435e9.4.2026.11.03.12.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:03 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 5/6] man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is required
Date: Tue,  3 Nov 2026 21:21:35 +0100
Message-ID: <20261103202136.13574-6-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103202136.13574-1-gnoack3000@gmail.com>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
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

In addition to the search permission, binding a pathname UNIX domain
socket requires write permission on the parent directory.  Bring the
wording in line with similar documentation for EACCES on other
syscalls such as mkdir(2), mknod(2), connect(2), link(2) and
rename(2).

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Reworded commit message and made sure that wording is in-line with
    other man pages.

 man/man2/bind.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man/man2/bind.2 b/man/man2/bind.2
index ccb77e553cb2..6838a9d164aa 100644
--- a/man/man2/bind.2
+++ b/man/man2/bind.2
@@ -150,7 +150,9 @@ .SH ERRORS
 sockets:
 .TP
 .B EACCES
-Search permission is denied on a component of the path prefix.
+Write permission is denied on the directory
+in which the socket would be created,
+or search permission is denied on a component of the path prefix.
 (See also
 .BR path_resolution (7).)
 .TP
-- 
2.56.0

