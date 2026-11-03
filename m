Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737323;
	b=jhpGJBDSDHMLIV5l0o6nb3vVvFy2+CatQLcOKGk4n5Q9TsucIFZEIaijJhY7GyftxUXI
	 TmK9+F/5Sh/SpZG+RzmFmV8UUGZXbTKFLgLgHWZb7pR9AvbH54CfvL0Abw/R1A1jSx/Yw
	 4+jrQ4MskgRkNh4yHnmusyRyC+/gtc9pX23sFIFL1G8Aids+oGxHhPXS3OFDFA2qWHV0a
	 txOQTQHEWy+HIlkMKfwFPu2QDBS44rUNgzU6JrXALICdRiPPp5iLfHgI76/jR5731XLEW
	 /vdXRzB06ug1YJKF0I4/DUwpIfdVMGApmO2YDATr+rQYoCpAZRKItc29Yv5R7tUAe/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DSoD8a+rA8YGbZJ2ewnO2NTmRJm+C6iYK7G7ozlIhwA=;
	b=dcWClel0+G/4cF4czSy+udki+aX/Cbvdusoazx+wK0Cl6xXhmhsbCmH57Stoqq7t9M1J
	 PbzsJx+0p8IWnqQL4nKGyNFG4a4DUWlBRUcwfz2N5oduzj7lkUm2mbb2dgKQU6++2Gix3
	 3OK8xGT1brNl2cMbJQhLFbdZyqNa8uc87tYmiFu2q42iYcH/HDvbjHC6hN+T//s30WPuf
	 ljYTNsYtBn/ZI3rSm1ZFQncHaaNQeZtz6hR9JMhCCiolCzLc4yolCLCFEgviKP4lWkiOz
	 jV0+dlslgofIP5hIB+rGbRt3cxY7si9TEL8++/SLsMxxfMohMVmOgAB569Bc/u4QcPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6VB5vpu;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC1606A324
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58EC1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6VB5vpu
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso2443937f8f.1
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737321; x=1794342121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DSoD8a+rA8YGbZJ2ewnO2NTmRJm+C6iYK7G7ozlIhwA=;
        b=U6VB5vpuTdD88c5Fy6AYHZMbRCQzGaMh8qAP4tqeU12YQX/MVDCNeQLLwZ7LV8Htl5
         Irn3vk38qqVhb4WJUqydt65KKTDeb1Knru3HA54SDHUDyw15rAtAG5mPuaQtT5aet1dX
         ns94KoLVp7FTKtMJqXE0KG2BHK7yMMyQfEy+WA6fe0atsfdxKuLpHBFeyYCk6rQD083p
         yAY4K0HnNoVo2guVV5BSc9rWjR0brl6V6zRZ64oyar15/5i1SpMdqiZFJ0TUArPyN9v+
         5C3Yghj90rCVgaq6aX2o1HwP109FLIgKYjvyzfB6/X3znBeqk/llosrgbT7AKDkxC0Lj
         UAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737321; x=1794342121;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSoD8a+rA8YGbZJ2ewnO2NTmRJm+C6iYK7G7ozlIhwA=;
        b=1poyZwMnPlZvdtKtjDOYzF+wNULEPm6pNbKPkBncgXkL4SXGajBv9ixqO7+jXZcW3t
         4X76oQdCFt+y+3BqhNcqzt/EOg5KZjYMx3PvBOx6gu6iiZWKeMt9TwROtzDo2BbhTTjF
         tevyNg++KSFsR57T7VPtFJrZSehZLmrQN/2lB83WYM8dyUMkA41c1SEsTodHE7M7jT/A
         X1ee+ip2JZhwuQhfcrfeVGV7rG2cssbUYlatCrOYZp1S9ulY8IVinPdro+wqxFgjMgF9
         7lHh5Omowtd2MKzF8y1+xwGembnxxGCnO4JbErcwKvMpDS6ngTbYzsAco6B0U7zyoveO
         ECAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9M5dNHjt+sa8pAChvYIh+KBoTLoww8AhmZiztS5sgl8ciK6Psfl6irHJJPTM4dvBT/Mw+qcMAU20=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4e6vXZF30ZzexfqnnSGHEKy59oZzIrPC+SLbRVOlYkoxyH6gP
	+M8OAvsedOVsE/TLxZCq8VcFTy9eUwJtsigtpADGgoBEcjVZr8vkp/8zEwyjkHVH
X-Gm-Gg: AYBFou0LgCPWh5xhTOGm5F+fi2VHNpAmcw8C61vFWmepWOKyouz/SisnfEfF065EwdC
	FmJT2VGxVs5EyfXNBzvsZEbyFXaPXXUSmN3ZbDwg9JLVym4m6BH4KV1a+xHzYVdTAHVpNHiufOm
	ndCc2M2DgzCeQEEGPzctyfSaNvcrAtnSd/t0L9MwcRNiN78fz2J1ZYcOq0QkuPG9ju157aYA+nc
	gglJvQXVzqneY3sgE9NeyNS/No3NLZPQqqfNO0pKzaeaYTaEyJEHKDcbSV9723KaY1g4XvfvPjv
	DEw+PmJuSqG+X4OMBcSNsX/PM6UvnsRidNsOGV0CtWh9PBvEPxEqLa61zjg9ksDL6Ieg5sOKyVV
	4Cyf9WB27KfyRBZ07GyCkqtqHDXVmqHPbIgN9skneEGDs77etTi6hq0eoZsKDHvEi4AhHdMi2AD
	am35eYt8Zg4dkRJ7VXXPv3VC7OQvoT1li9GPiavzZtnhGk+hGCSbqrpWGEotQBdIw0S0iJUCrl4
	2kWz1X5WHe7Db9dEBS0sXe99rx1zgbOQM4q6gRKPNYY4yR8O0GgpBI6nfWRkBTNs2qx07EciZ0y
	FKiKkOEO6fvS6UlidmXBWcqyTjXL2iqr3Cz3eg3si1f5QN52TNRs9Q==
X-Received: by 2002:a05:6000:2c03:b0:48b:d9:cb52 with SMTP id ffacd0b85a97d-48e6e4fdddamr29226387f8f.27.1793737321542;
        Tue, 03 Nov 2026 12:22:01 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcbfefe0fsm422210f8f.13.2026.11.03.12.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:22:01 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH v2 4/6] man/man7/unix.7: Explain Abstract UDS scoping to the network namespace
Date: Tue,  3 Nov 2026 21:21:34 +0100
Message-ID: <20261103202136.13574-5-gnoack3000@gmail.com>
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

Point out that Abstract Unix Domain Sockets are visible within the
current network namespace, unlike pathname Unix Domain Sockets, where
the remote socket is looked up through the mount namespace.

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
index c370b021589a..762bf0d1fe08 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -257,7 +257,17 @@ .SS Abstract sockets
 Abstract sockets automatically disappear when all open references
 to the socket are closed.
 .P
-The abstract socket namespace is a nonportable Linux extension.
+A socket can connect or send to an abstract address
+only if the socket bound to that address
+is in the same network namespace
+(see
+.BR network_namespaces (7)).
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

