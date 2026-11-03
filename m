Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737372;
	b=rItlfIOGBt7LOoSk7EUX5+yGR7uSDML5VoVThh2vWZSmCI0mKsWTfr9Gf+i1k4AeYf8V
	 YdXDeu4Aue6nhf8Ften3K3BW1nH+KDQkXeDSYcy64isRdL4ltwXbWwBQhBhNZ4/l1cGdI
	 dNRSxixhMaYl2v/mzb1KYdgiYTwADne8biSta11iutpYHsaIF1j4ZE+zIm5ZwQbNnBr2D
	 npqyZRf4ebX74P0IktEvhi4EfyDD5L1AWkvHYhr82LbTv4oBQxSyEFPEY37nbUm0CzwC8
	 K1gej62Expo73PN2ftWGk9s1utdh3ZPqndXkTAtzpzPrbt/h3fUpomA3kUaOKCMXbpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4zvA8xHjnRkGxevxQKCBzmgAFVtZ0eEgjjmDYK0ETB4=;
	b=NH37qsTxgfYF/qJUBqYtk2QNDnP4C9d0gTN2GFQ4pxjQI67Yc+YZVTuB0PS1Q71T3+dv
	 lWcgWzeQ3sN2AxLCMuxpcMglHM1nGSp9xhTkUst/+GCRmzzPipP3uLElVkOSBDvDhuOha
	 crQ3dVYa500GNkVU0WR0hMum/9CBCw01zY2EB4KO7lGks6R+wAnp7OU7vwPLCmLx6vYL+
	 Fl1ov/2PzPSOvGGPQILDfHp9R7o6890Z7JytvkI5JZbaqY+650yOwZGDMlu8cQXWJhRi8
	 qzlzSakdoX8chKOuTmgpjZ1EHLDKzCurr1fEB5Or1xydbCKc5L0rqE7srCg3sDgLOBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qay1Oo3w;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF5606A31B
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55EF5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qay1Oo3w
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so41964485e9.3
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737371; x=1794342171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zvA8xHjnRkGxevxQKCBzmgAFVtZ0eEgjjmDYK0ETB4=;
        b=qay1Oo3wfloXfY46wcByGoTWsdkpdpql3dQFNDiDfSCITdFfSYZV7Cbstzm6rXG5Vd
         2NjbzeroePNwMY5xPwGv69gT/YBcC/gBzyrH942GwS8PL2mV5alvU7q3QLG/nIBjTRav
         Een79wjki9WCl2UAjtDAHn28byxIWhQm5fWCvvj3Hm40IGr8USgbQmDwhv90bYARKMwq
         YZLBdBd67URBs1PlAXy0Ov45sT5Siw8AzBCxmImKSpVVez4PROwoVKiwqxsNT4Pxu6sp
         C8NgKMlq1MvgGJdlh0R5NFq2ng64az41QzF34mSWHB2HNyao/rpvfjLthVexp8pFODzX
         PdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737371; x=1794342171;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zvA8xHjnRkGxevxQKCBzmgAFVtZ0eEgjjmDYK0ETB4=;
        b=0/bYv6Dw3mYyMNF10q0A8wAu80RSrYhvse2X5feGN5RciCsFO8i7LXhFp7RRnfMtpa
         mdHYn9QqN7EpPsAnWQugEu2ZC+nSMwKa7OF2VqFxSSKPA47HfPY8CzWR+E58lPZEa1/b
         t7kM9zeCh+FmrWwiXlyONq0cuMTndKLj9k77a8UXYFdwLIq742AKMjN9jDFR2rCTTrbo
         zPaOUsnhmCNiJMTxw/O7cZTJl2AePe3McmujrhYQiJCR3dDUeIQ2LuCD1xq4bqM7VVmy
         P6DUxeNQ2SrynP+bcXlotEp3yjWfA9HcjrLDhui1+dWOE9DrC5fI/fK40SJ7Rqzp1c5V
         BUxA==
X-Forwarded-Encrypted: i=1; AKwUvBx+apfE46Ww+jEcsiow1kNHmNmPBmCJykKq11oojLfiW9/oggNGz3ZNVH0ZZFLSC5ddLPCDZpwZ6Fo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m/zDMSyNRu6Bxm23qiozKxdV4AGkCuCggfFbWcJG0Sx/Ai5AZ
	2KaEW3D/f/eb3FJdLg1f7HPsnSRqbkvcbUl9Q2gBqGJoQkCHaXlVcc8K5qmRD8UA
X-Gm-Gg: AYBFou0xw3N9Rv7LB2v/NxNkkmHkVPEWk/ONsAqfi1KZmVBPCCOG5BLkU6BPs01igg3
	J6ZpDf9ANZmxqv8HE6tZj9COlj+fTPbA26gCbMMxoaGwYLKCy/hyvnpHjsJoai6tqKksCtgoEed
	WMSJx5RzD0qqA0CYT1Z1Scov6BYnN71ccjO+KTXi0uxPiRUNue3Z0cRCTsDGjKRWW3zTcdZNWiw
	eBNL5FvyFQzg1Pf3U1xJDWt+G1moi4pLQlHVggLVBg2+oCwA4szdGHchNB4dbJzForX8AYbgOiv
	cXpVHM6u4SIJxD33G/gG5J5h7WHOIpjGzPt53RDHONURyOkT1mIucz3yMs4vmErWMjIlzoI5wmW
	Qdn1mjql4LDEsyUYD8J/MxXXlD4qi44/laXL2dz0/wliA06wEzoEu53aDsedNIUKz0jTosQDRwI
	YZwNrwJVzFmAkLjaH0/v/BRCmg1lCOm9ixA+kO1tppRmCX3hiLOCUl1JA0V9jWdMYLE0qrs7b69
	/Oyp6w4GFbmWJu92AdQDZydzbkLi9IG6qNWxvYJX1Ajj8N3MUmaV1aZPOyOOoQp9r0kds72xbxv
	6pJiIEQtUxsHvpOjagZO/mPaRFVj/BtgiI9Drn5W2Z3zGR9viRbFNNEcZNahSDQ5JKW4U/WWnoI
	=
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr144810975e9.29.1793737370626;
        Tue, 03 Nov 2026 12:22:50 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm402285e9.3.2026.11.03.12.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:50 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 8/8] man/man7/unix.7: Remove mentions of "namespace" in the general sense
Date: Tue,  3 Nov 2026 21:22:10 +0100
Message-ID: <20261103202211.13820-9-gnoack3000@gmail.com>
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

In unix(7), the word "namespace" is often used in the general sense of
the word, which becomes confusing now that the man page also discusses
its interaction with the Linux namespace concept (see namespaces(7)).

Remove the remaining uses of the word "namespace" in the places where
it is not referring to Linux namespaces.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 man/man7/unix.7 | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 1b4cd242657d..b8a0b2aca458 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -24,8 +24,8 @@ .SH DESCRIPTION
 efficiently.
 Traditionally, UNIX domain sockets can be either unnamed,
 or bound to a filesystem pathname (marked as being of type socket).
-Linux also supports an abstract namespace which is independent of the
-filesystem.
+Linux also supports an abstract socket addressing scheme,
+which is independent of the filesystem.
 .P
 Valid socket types in the UNIX domain are:
 .BR SOCK_STREAM ,
@@ -135,7 +135,7 @@ .SS Address format
 by the fact that
 .I sun_path[0]
 is a null byte (\[aq]\[rs]0\[aq]).
-The socket's address in this namespace is given by the additional
+The socket's address is given by the additional
 bytes in
 .I sun_path
 that are covered by the specified length of the address structure.
@@ -297,7 +297,7 @@ .SS Socket options
 ancillary data.
 .IP
 When this option is set on a socket that is not bound to an address,
-the socket is autobound to a unique name in the abstract namespace
+the socket is autobound to a unique abstract socket name
 when
 .BR connect (2)
 or
@@ -323,7 +323,7 @@ .SS Socket options
 As with
 .BR SO_PASSCRED ,
 when this option is set on a socket that is not bound to an address,
-the socket is autobound to a unique name in the abstract namespace
+the socket is autobound to a unique abstract socket name
 when
 .BR connect (2)
 or
@@ -975,7 +975,7 @@ .SH ERRORS
 See the appropriate manual pages for more information.
 .SH VERSIONS
 .B SCM_CREDENTIALS
-and the abstract namespace were introduced with Linux 2.2 and should not
+and abstract sockets were introduced with Linux 2.2 and should not
 be used in portable programs.
 (Some BSD-derived systems also support credential passing,
 but the implementation details differ.)
-- 
2.56.0

