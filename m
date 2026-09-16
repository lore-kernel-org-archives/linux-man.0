Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F581509EEA
	for <linux-man@vger.kernel.org>; Wed, 16 Sep 2026 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566742; cv=none; b=roCCPhDNP6oGleokBknXIa24EPgPuhY/EZCZ7UH/Ar9VtE4tLY3jFmMhg6VlOjt4DMy51EDMZiZr382em8TkEBR/K5iQndm2vz2IuwGrkt5YwKrVn+m5ZVYrztKHdCjW4INSklPqx0uhLOIUPBm35Y/CAHSId2Rc0HKclkG+iD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566742; c=relaxed/simple;
	bh=T8Yv61LqH4tuZjRHE2lGJ8C17f8dGSJTVyo3HieOuVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dlYnItR6eaYT82trybP9wDMSWqmuMdUNJkLoc0LhZLtFH1eCwBD07OjQsGX2nPJ0R8L4OepjojDg0VT9fbXsltqICoSKyM9q8Q/m4bDMgPnb9BwDfeQXovHS/Xh5O2+f4vUDwiKzzV6Txe16Hctr3Sadec9U+dpoyhvu1pPJ0Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=spit.ac.in; spf=pass smtp.mailfrom=spit.ac.in; dkim=pass (2048-bit key) header.d=spit.ac.in header.i=@spit.ac.in header.b=FC4DAbI2; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=spit.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spit.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spit.ac.in header.i=@spit.ac.in header.b="FC4DAbI2"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39647184c73so1784821a91.1
        for <linux-man@vger.kernel.org>; Wed, 16 Sep 2026 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spit.ac.in; s=google; t=1789566731; x=1790171531; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cj39kN8A6iXEQ3nMlYEzg9AKc7uNStS+3fq5xofKEFo=;
        b=FC4DAbI2P3LeJela+gcEXAotz7xyZEhaTcS/tgucCNsvDAdbWUHP4LFHqr+rLATu+d
         KNgY2V5FLOPerQI0VS8j4zJiyEmE4+qHWZpo+AUjMqVu+pbLWX00Prqz5D9OFuazw2kB
         L+xIWnmVStEQCrNqs128LpHe/n98PLH7vCa4gifXalSVxkjdZXy7V7xhS8xvwC7l66gv
         cKxW/sWa8gFubGlHf/MFdoUjJeEy2ARjXX0enYCLVLYtjrYDp4IOSSIjD62Oaw8+bTpQ
         0RStmWg+FleFmvmrMpoqeCKK8JxyOkFC6fdVtEKXZubkaBUwBTSpoPW5G0NJRPhr+FfB
         eGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789566731; x=1790171531;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cj39kN8A6iXEQ3nMlYEzg9AKc7uNStS+3fq5xofKEFo=;
        b=2TkUUgj6+rxIzz8o1j+IGhjh959/bWvwwtyE1gmEig+PIlGhF9x7m9BCmTudy8pfeM
         kmG6vzTfwb5NClofURM9ZGXGggyXUgoU4se7V+Jc6n/J25obUS9EegU2UQAvlQyB2KmD
         zyq6qMgPQWATtPfKb2OrNRAYdsFurlGIv1aE8fu79HS8XkR0s1gNwJRbrOGUZfpbajeP
         ZF0BBltA7ePxA5PTmAHgTmOSi78HlmqyM4jF+WSyz2UBj0UcPOLy59T/OAFJJRRqGdIV
         sO/1jG3nNW+75BhOA7X4YFWBaWNFlBA8lhlf6G8x8sM2UbqHMFuP6k74YRoylqXjLkOx
         WHyA==
X-Gm-Message-State: AFuF++nvi7+iS38X2aY0mj+uR6pTt0XvFUbw1xBla8exs5qZ8sleoqhJ
	MzGDPuAmeQgskyTtU1BO4sRRXnkAi6ExFo7feYXwtsTUsf5HEM/T1Tp68SZaKaMUiO1d9XDepun
	M5FYTUhqFw81tWhSBzi8/QoybbshRtCUnS0hqJbPI78/M9iF/hyvMsdE=
X-Gm-Gg: AYBFou2Fo3FCnTE2GbwXWrcZska7536CEwxIEFkc40jC6oKD7U4iNahbxj0N3r9L/Qb
	I4brgC+rZx1oIkccSR/qZ+B+BDpJERghLR36dkd4ncmMnVKCFg1MdbXBCFCQUXODoP4hBeNeW8m
	ed9LLjrLbEWWgbXMLtC95eNIwdNtDkaToSe0dSprM39weyytFfh3mQyFDl9V4pMNoc94/ZJZ7pz
	ORqS6/6j3VW3dKF6N2C9cqqmP1JW7bkTX5UWROfu8CmttcbWH1gWArk5/OjVBvblVTxrrcKWl+W
	e6yzrW0P7o4NXC56LikIja98IWxkwjz45MJSqaw1iGpVHn11BjHm6ltYNq2M96rEUSKcNJ+8rF5
	AUYMSayCR2zeFHaFIByQ4VPfhuF+IX8QIWbi0VEb9ZByqw8CkD0+whndXFAiDPDvgACdMxTupIY
	yq/pQUB2HCcyxMkPGGLWnf31ARJBAyqeAUcHBfC4lnh/Qum6ev1rLHrPqpC9OhtF2TIOdpiXHUq
	Z5nlzldFA202+HsrNV/dKgjnrgb6aFjd7K+hUi1qKYjalmOU4gyH34gmlWP9A==
X-Received: by 2002:a17:90b:4a:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39dfe070a4fmr12475804a91.14.1789566730996;
        Wed, 16 Sep 2026 06:52:10 -0700 (PDT)
Received: from AnmolsLap.tailf2b25f.ts.net ([103.104.226.58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5af6593sm8060690eec.25.2026.09.16.06.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:52:10 -0700 (PDT)
From: Anmol Katiyar <anmol.katiyar24@spit.ac.in>
To: alx@kernel.org
Cc: linux-man@vger.kernel.org,
	Anmol Katiyar <anmol.katiyar24@spit.ac.in>
Subject: [PATCH] read.2: Fix mangled SYNOPSIS macro
Date: Wed, 16 Sep 2026 19:22:05 +0530
Message-ID: <20260916135205.84561-1-anmol.katiyar24@spit.ac.in>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

The .BR/.BI macro pair for the function prototype was broken:
.BR alternates bold/roman rather than bold/italic, and a stray
duplicate "size_t count;" fragment had been left in from an
apparent botched conversion to the buf[.count] bounds-annotation
style. This rendered as invalid C:

    ssize_t read(size_t count;
                 int fd, void buf[count], size_t count);

Replace with a single correct .BI call, matching the bounds-
annotation convention used elsewhere in the page set.

Signed-off-by: Anmol Katiyar <anmol.katiyar24@spit.ac.in>
---
 man/man2/read.2 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man/man2/read.2 b/man/man2/read.2
index 8eb222743..c460a2a61 100644
--- a/man/man2/read.2
+++ b/man/man2/read.2
@@ -14,8 +14,7 @@ Standard C library
 .nf
 .B #include <unistd.h>
 .P
-.BR "ssize_t read(" "size_t count;"
-.BI "             int " fd ", void " buf [ count "], size_t " count );
+.BI "ssize_t read(int " fd ", void " buf "[." count "], size_t " count );
 .fi
 .SH DESCRIPTION
 .BR read ()
-- 
2.55.0


-- 




*Disclaimer*
*This email and any files transmitted with it are 
confidential and intended solely for the use of the individual or entity to 
whom they are addressed. If you are not the named addressee you should not 
disseminate, distribute or copy this e-mail. Please notify the sender 
immediately by e-mail if you have received this e-mail by mistake and 
delete this e-mail from your system. If you are not the intended recipient 
you are notified that disclosing, copying, distributing or taking any 
action in reliance on the contents of this information is strictly 
prohibited.*

