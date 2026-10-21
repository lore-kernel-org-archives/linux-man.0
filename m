Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616904;
	b=2We4A1LDYgn+pBRuIIj/DJ9YjpK4lPkLfiweBdrRj/+BWadfpHOAkVHqVEnrC9Z7NzaG
	 v4Ip2u39pZAsFQ9Wko3uWXoyvWgdq5i9RNC+NKpRmwCRblV/RQRzKZNKOsuwOG0Tvvi/X
	 pC5OOIMckemxYKFrR7YG2yEn/zZgJRBN9NlzEHvW3nMCaUm1dsXaPa6J5KfbQCXWQf2jF
	 Zhf/sA20g69eW9STpiOtlBAx+bvIAYCUbEYlnkvV9d5v8T4dpfBxnoag4QRk5j1f8XvFt
	 uR5B446nVg/2MibD9cIFe2/2Q6Ml9wbqJEEfUa+fq+sGj5lKTM7nF8GbysW/hO9wrKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=W82Y+Bs7qRQy/vCMCyUpYOAxRDJmQndEnw3UGh6w3E0=;
	b=uaRfdgzct7aEtqMx1w02yccmduufeiowO70/M5cgVro6MBZUtHxzFabucK2Tt+Cg7Dal
	 TEv85U9McmUuJpsQROnsMP2scjMmEkyzMmB0l1WsPlfk5GR6XcQuBKzfpRZQ3wThdVPph
	 RJMIhPge3u1tRmxYuHK1ZrTTWvZnWuRto5cb9JbHblwMF8uumWTR9mYQelXOBQU686cYw
	 Ut2mavldqGIOT9hd18i/Z55kigTkFl0MrTlQbzKpulZtX8G2NzA62zq/PULKtxmNhdAwC
	 6vBGEekQ+cE28NzKAtcddTkjAREBy04qJjj5NTLZxyQAjLu8Ohp1CC4Qd7ehyXuCjXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+9zeBJv;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E056606A319
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 21:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E056606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+9zeBJv
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1169418f8f.2
        for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616902; x=1793221702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W82Y+Bs7qRQy/vCMCyUpYOAxRDJmQndEnw3UGh6w3E0=;
        b=S+9zeBJvAcKyUxIuMzFBHjJdaodqTEu+B2pByTawylAlp1HSEQcXdHSlnZGSYY10S2
         frP3c8MivSS8e1lDPmnh/ew2aVBJRcdTK6THgU6JK/1E8dUwWRz3bkHpl4lXNfV8guZ3
         OmCFHrYrc+fZGAGFNIIu8GfPt95g+LkaOhjMVGTGLjIR1IgxeNHRCTMjMhams13wHhsF
         RT8YXtEWnerbxb79s/ksJv9n1Uf3Ovh7ErV2mMS7CSJdDYxvtJTwPqlwByk9FFMN7gfb
         yOvd8gL/op1vj12gIUIAg8G0+cs+CxOndoTGCIhgmqDX0i2ms/ddeEp2S2/CaUY4+cnx
         OdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616902; x=1793221702;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W82Y+Bs7qRQy/vCMCyUpYOAxRDJmQndEnw3UGh6w3E0=;
        b=LYwH8UVKxjPb1BUf9AciVgliMzP6NhmOK8fscugddPD7RKpYY/Ppud2GFwH1pP+FB8
         +NlfukNELJWUsLr98EQTZSvgMBxxyHzW0gL2pgU2gaZmJ5zBDAb2QrK2yCLNobF66YeY
         fi4UfOOVngwxH+wjsWqNwG//dc/uQg9Lub/kMnqxbemBFs6MYlnw/IkRYnl829EDt0m8
         EKQZzfpttUOL+yaNA2W8oFRQxNpYl/Cl+pZLpcnh7o+uPB+pMby7U50IobE4YZow9jCR
         6QS2ePtrU3mhgglh4SMuPdiUrqjSeVvhu/vGM12nYb/ZwF6Lm8PFq/Hiz2yTLAuD1Ep9
         gjlQ==
X-Gm-Message-State: AFq9FYIV2wZ7aSB9uOfh7/QccrwNdsUZqWKgmbqinGvB86tGq2YAuKQ0
	bF5lnReXm+mT2JzE9mIS9H+TzcBCcThFcj6aSVW3+iUNAiOKoIR2DZjOBgc4V2OR
X-Gm-Gg: AYBFou3Qrh8h26Tu3UZfbwiIukk9wKJe0OLhwnbdouf0QxCSoQFERluktZJqvpuVBEs
	f8TYYsfTfTdrkwHITjyViiBS5JIx8wTucg27dq0VBCaEXFbdoNyrkHKsOoezb3JY+hqUMTAECUa
	kpGcWbHs8msvIv0sxPj/dhWVGPfamcdnvBWN2f8dZbglonSE5rHw9M3iDiQjLblaJY+Sr8zia0Y
	2elvSghTLwnS2xCHUHDMpt34HhgSTVbP2HN4iKrvYmqjIA5Rx01/QVZ9WK/Q1prrV/QD/0OSScq
	SzHJe3RSduSyE0eLoMCH+XYqu3OrZcvhOgO2/jA08hbvGZORqWhLhESpAMroMuy2u3WS6ZjBtg2
	N5rlaI9RgCraSipUqHnjw94xFwE+ZpjCbsr0IwHVxZJqkb5bWfPMHW7IE6NGAyIbnEMsp+bt3iC
	zFbxJeewRanubdpn0hDNOjlU+J2iN3v6GqO0ZG9mgGBGNhyswDpQntHpjBmpAqw7USv+KXPDkXF
	TPDIlnrXBoXiaSywY7SxAMxP9a0OGQGON9xVPYu6zUvJfnxbwmD0AvDjPXxNwgep99VbkguEG/j
	NfdWz1Gzyw4d/iKMf6Qtz+QSMQ==
X-Received: by 2002:a05:6000:230a:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-48e264dfcf6mr7479095f8f.46.1792616902263;
        Wed, 21 Oct 2026 14:08:22 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm8716285f8f.42.2026.10.21.14.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:08:22 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH 4/8] man/man7/unix.7: Explain Abstract UDS scoping to the network namespace
Date: Wed, 21 Oct 2026 23:07:56 +0200
Message-ID: <20261021210800.27338-6-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021210800.27338-2-gnoack3000@gmail.com>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
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

Point out that Abstract Unix Domain Sockets are visible within the
current network namespace, unlike Named Unix Domain Sockets, where the
remote socket is looked up through the mount namespace.

To avoid confusion, remove the word "namespace" from the subsequent
paragraph, where it is used in a more colloquial form (there is no
abstract socket namespace in the sense of namespaces(7)).

This is already described in network_namespaces(7) as well, but might
be mentionworthy here too.

The lookup of Abtract addresses happens in __unix_find_socket_byname()
in linux.git net/unix/af_unix.c, where it is looked up in the network
namespace (struct net *net) in a hash table in that namespace:

	sk_for_each(s, &net->unx.table.buckets[hash]) {
		// ...
	}

Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Verified in code

 man/man7/unix.7 | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 4c46b54206a5..232fdbf4c3cd 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -257,7 +257,17 @@ has no effect on the accessibility of the socket.
 Abstract sockets automatically disappear when all open references
 to the socket are closed.
 .P
-The abstract socket namespace is a nonportable Linux extension.
+Each network namespace has its own abstract socket namespace (see
+.BR network_namespaces (7)):
+a socket can connect or send to an abstract address
+only if the socket bound to that address
+is in the same network namespace.
+In contrast,
+pathname sockets are not confined to a network namespace;
+they can be reached from any network namespace
+in which the socket file is accessible.
+.P
+Abstract sockets are a nonportable Linux extension.
 .\"
 .SS Socket options
 For historical reasons, these socket options are specified with a
-- 
2.56.0

