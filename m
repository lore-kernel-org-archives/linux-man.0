Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737363;
	b=dBur5jCZfscYHOkIsNi6Q33P4csW8AbVk4X9FVRHk+IF3DLIm2NAzYrYn/VfL4dOheZ8
	 qEx26CiOBzaonzxX970PS0qPVHw5o+dTdHxtmqKJ33KcTV97D7TFfRFy+uMd5czxY0ytP
	 oHud9jkJqSYtomD0A1zJF9A0SpPDzaPreeZo32Gr2k64hfRwiqJsSovBDR1wW2V/BxyaW
	 G/o67RKn369/buRq3S3DVt6so884/jj5a9pvfgE0yt471xvmfGw5idq8viUE2odgs27sB
	 PTXsmgnHJ5PUEoYE7ttrHWfNyymUxiOJhNYEckOwrzpw33rDr6jpN7GQbIaxFcWDquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BLb5hCuDIuDgGTntL6n3dUC/TLQUY96a+kJ75w3EeVk=;
	b=0vUCOYS2L1fTcg2jAQF5lQIQha72COO8UKwchhrmNKlQSpL/GFZPZ6e3IIGfU6qdo39k
	 e2KuaDMNyerpJxkcYQOqbsOKDQjI/3IMcCCoxfj5K3xVgnHd30sQbDcCi1+pT4dHQ5KFx
	 P1lM3jgQfbprY/XXTKHZwyy6tdyqSPIg7GizB3th3TGbJA7zsD+/BWZ3fzBV4aUBv8pvF
	 z8ljOMrtNaKX5pnHdCyzXaMG7D6WNFBK3+xPaOl5ylxhmdBBVlbqxn1k3vgZUv9D94MQb
	 zEUgT5KEBmF7R7VPlWeYH6jV1+n+QggaWZ7miaJHAt4AOW9OZ9oEJrkxjYLXNHcuyHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHa26OwS;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A074A606A328
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A074A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aHa26OwS
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df4f540ebso2248105f8f.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737361; x=1794342161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BLb5hCuDIuDgGTntL6n3dUC/TLQUY96a+kJ75w3EeVk=;
        b=aHa26OwSbSpA9G/5E1uZjda7mP/PenSxx83U6AOrJ5TszKAbXqqXBRqbfPlHynhKMo
         xwHg67/XyOd7zDps9GLkW5xli+NMWnhqQZWqheXEVRv+CLCmdSaMZTanELxzE8BncqsP
         D4pgyOjpvTExjeHWC30qpjUZpWz43H35qvJ6lHU546OqQZPd2iUR/x2xIWKqYMsezUxa
         HHSReEndBSkYVHuRQgfwsC/GClDtpwU6cMOg0NJGwHOY+TAtEZX/qD+mpyv3vOWoYEb1
         CYBMc+TjJOlXtRFjm/uzYla7KMBai2RYiC1CZnJh1WCl2AP4YcPmBA2Cui3rb88YTLOb
         ntlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737361; x=1794342161;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLb5hCuDIuDgGTntL6n3dUC/TLQUY96a+kJ75w3EeVk=;
        b=KbKDDR8xjjq4WtJY0MPMXF3HPpmeS1zwy0xH51iruOsWmjnSRMR8onBGpZVkxfqoB3
         N6DWemiAE/Mp1hd6Lok2ud86haRBiwNlIBd19IXO2veImOEf4GInGFyF/nofjOdgCkCd
         rkfu4lzjIwssU3Gvlawe8N+n+kdNHTnsxUu2WI5keUpXyIMsEP77Cc5Bgl7jI7EDITSO
         4Vtnu/v6OYPcaI5c/VyyVPgVkIXckBvKCZ9hJp2nQxRij8JaZ51gGcQdCFlt3LngXe/d
         kQcYAsYN5LfHTxMCE2k/7kHj4a/qD3Kgdz/I956rGEiWZT/fZymH3Kvg/mpDG2PnbQze
         z4sA==
X-Forwarded-Encrypted: i=1; AKwUvBziJEg7Y/2YMNwns1SSBsaokgeepz23lewx4AnPFURhGFlYV01/qBm4TWNHFfOVt3leTVhEnuCySOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Qh28nghADY3mYYBbnXt48cRt00XpTpZbte30fFSLTzoMGCNf
	C2ZfEPvaFuAYxsIsUVoMWC8DF1ERFsuKuLgvxb8MJKGP9MuyScz6VEjCWLBKUpa8
X-Gm-Gg: AYBFou2SLVu17MqEd03+eUmMYrbQQYx6XadcIfpppBOSscuYmgXRBgCAJ2AQKpBgMWS
	3m9Bz4q1IxYe/KyFZNYeX9Bfn0Dc1zf9SliEtmyIb44+W9sZDeXxsryWzUNyyD165/Zzp9NRi/R
	+wgLIg6u9QgW3AvrIq2W9ckuau3eVUJmLyqdQD8f22CTTD2GSROK6WZsRXYfFlbuDBuEeF0kkoF
	5ty/BCdhUCoInwdjJKUmakUO4zgftzQRfMkIPFpqfTDI10e/2f/OLzFII3NHAgNrxyGiocRcJ+H
	ZvThl79wBFKSk6xFroWdDBspnyiPZxvriwbat7Cw8OmukeZCq5VIvzTfFyAPjOlESxvHDMt6FXe
	M2DnGtpzTPP2P6b5e7STzUsj1xMZlyEnxDmY5ODpeB54Q9tB86qPmR7ib+7uCBXD3UdVSvHi90t
	hk7Ge8+haSRRPAXsIYJAqHeU76XuI4SSv2UfWUGY04NJ0cOUuvglJ0aAFehUixJJF7RqwVAsoXS
	m+fa8Y/6LBbuRQruHDdkHNXyjs7cm789RTEhdc4u4MNAhHR5YGojocXHXAl4GBBeF2SzoIWEFYt
	Dhyc5NkQuHHHNOeVryHgN7+O0Vm8x3gsVTrAjC526x1aJoa8nAnqwA==
X-Received: by 2002:a05:600c:698d:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4ac185bd1e2mr326180055e9.16.1793737360992;
        Tue, 03 Nov 2026 12:22:40 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm73554715e9.9.2026.11.03.12.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:40 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Michael Kerrisk <mtk.manpages@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to other LSMs, not just SELinux
Date: Tue,  3 Nov 2026 21:22:06 +0100
Message-ID: <20261103202211.13820-5-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103202211.13820-1-gnoack3000@gmail.com>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
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
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    This feature is also available in other LSMs.  Unfortunately, they
    implemented it inconsistently and that complicates the description of
    how string boundaries are handled.  Linux does indeed neither
    guarantee that this terminates with a NUL byte, nor that NAME_MAX is
    large enough to hold it.
    
    After confirmation from Kuniyuki Iwashima, this documents it as
    returning a byte buffer.
    
    I prefer this variant over the previous longer one, also because it
    refers to the individual LSMs for the exact format.  A reader of the
    security context will require LSM-specific documentation anyway to
    interpret the security context.
    
    This patch is still LLM-assisted, but at this point, since everything
    is rewritten now, the only LLM-assisted part is the discovery that
    this part of the documentation could be improved.

 man/man7/unix.7 | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 61f06a74359b..c0e2bdbacdd8 100644
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
@@ -538,13 +538,16 @@ .SS Ancillary messages
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
+For example,
+SELinux returns a SELinux label as a string
+(including a terminating null byte).
 .IP
 To receive the security context, the
 .B SO_PASSSEC
-- 
2.56.0

