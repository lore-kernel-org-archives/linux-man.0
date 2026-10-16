Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6D1582BAF
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171997; cv=none; b=swqOQELeW9TLV/o0ScBIEZlz5vcIFar6QeLZCXPYf5okqipN2FoLbd1PX6ewifZQrvNfJDdOQg78HFWjvMczoYI64c9Def17hQcuTndSdtlunEKZL6/PwgKmMpM5aRRfcBM+p1NmDkdU2A5jPeWlCCALEabnyEQZNZrT3bSWjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171997; c=relaxed/simple;
	bh=Jy+r+2+b6EzB9Yk4K3GQzwInpH6LnJDJIeWHlfRJ/dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gK4cgJJvyeqdUOo7swHZUT5+wPV3DdNEue7uj8BAX20isIFZx8bg4me2CAKjGQ3QUUCd1OYLgpZQndPFoSXix20fHiTIFfog8yB5K0j8CiwzxuchMZ6y3q/9ITeqQMXMHUGs6jTeVpZtzTOvO86egsM/W1aOEdtDCEpK+2McLos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qss3bTbm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qss3bTbm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1d665a5efso2204535e9.3
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171994; x=1792776794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yHKf2dSMbVHd8PWG72tTifGnaOW/s5ELJ4Nu8g437L8=;
        b=qss3bTbmfJh+kAym9Jc/xi9Oh9ulJwKYNl+NQmrjLk+DRbgtW6Gy2e+6iwlvI1r1AF
         8n+eWqX9aMxWDIxY1uQI6xhiOIzu+dNujGO1rAg3fr/D5xGH14dFGKeWZUhhbTF5eC5j
         1gyQl9jHukvx+jOrrXl+61Mtze8GoNvyc8QwG/CNluCWo+JRWu9hWv8gbT+/9saR0/mj
         uZfzyMHRWY/BKiEmqjPRbOnUq5d5Ns2l+wxyh/ALRFKnIxW+t4RmXUGEPjgVbdh00aUI
         kMmCfPq8HeZALPDyZ7i8mrHPWheV3ibO+MZXiSY7eCMWOvNmgja4xfneM+uLGnIpC2nZ
         lOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171994; x=1792776794;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHKf2dSMbVHd8PWG72tTifGnaOW/s5ELJ4Nu8g437L8=;
        b=EooYxXLTDJPxNtrDmWqSVRzA3/dIiHINIGPQ5swLJ+tOVSqlvQZEIScrdDp7kbUxF1
         igi+y/wSzVTKKjU8q6yO+kiGjbcXEANz/DKuN2jryhqMZ+rZGrIw9172IjgCiQiqaoZe
         OMy0eOR/g9SBMZVN4G2tQRV1XITi0+cRLcWL0necWDXxIBRe+cdXfqJLL4ChiU1IR0WF
         Dlf+KOiK4rKjqnfpMseadCxg3EOQoXCCZUt4mgMH43aRFW7Bko56QOsp+A5cslINlMfy
         nTFa2aCGkobZQ0+2d9Sb/jzMYl7GPHSyH+zmJpl5iWlV8HCn8P626GW8Alfvd1Tpxy6N
         fsXA==
X-Gm-Message-State: AFq9FYK7ML/OR137YeyXZ3PxO8q0il0ERg67ZmtTgOfXGoy3HYcCNOOU
	Vxhna6BoA1JaPvNM5ZOHJwlobEv5jntO+qSJu0Ri3nB7G36pzg9ZEIGq
X-Gm-Gg: AYBFou1ZNJm8Mqf9Y8S8Z7yUXnfHVoU11ZDJ1F0laKgPiAUc+dvrdbVqnJNnT0F9kUQ
	EJidlLcxzA5EjZwhYiVOJhQFH73vE0Q22UfNVpV0rv7u80XKufhJnfiEvYF0FZ2+GzQbeE74vG2
	pPj7Rw2jzzCmKinhn6v/7O+hvun0mrUM9ymo2Nk26JqWnBa5Wd5THRt5iojBWEEaybl/PibzILM
	9lzcY13rZnM8G9i71qkrS4Smg+wq34sBhS1uSYFxlqnxcDG4H0s7ssSAAjoUdO8f/0L0BweizmP
	kcC4bcu1NaLSTYy+ccXWQXobW6hyW5O/+iLe5Ia5T4xdgGTLEPiP4nU3VUkQHwVot8FeV3eBLGq
	+9+wXyB/4bf7GTJPek9jv1BbDXUMinGheqBhtyy+VRA6rIL7RsLy5PYHvNU7pqyusvEtd5SI87j
	1ikAa55S/tjrDxs7l+rLCBMQxGyC1g6pFiJplfVbliPvhRLOaPgko3LTktA0osSelmyWvHsfQoI
	jiL/jpKFXrT1U754E7YPQE=
X-Received: by 2002:a05:600c:c117:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a1d75af362mr8789095e9.4.1792171993870;
        Fri, 16 Oct 2026 10:33:13 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce325107sm55797695e9.3.2026.10.16.10.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:33:13 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 14/24] man/man7/unix.7: Several items of the same type may be sent in one message
Date: Fri, 16 Oct 2026 19:31:29 +0200
Message-ID: <20261016173139.13076-15-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016173139.13076-1-gnoack3000@gmail.com>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

__scm_send() in linux.git net/core/scm.c walks all control messages.
Each SCM_RIGHTS item is passed to scm_fp_copy(), which appends the file
descriptors to the existing scm_fp_list, and fails with EINVAL only if
the combined count exceeds SCM_MAX_FD.  On the receiving side,
scm_detach_fds() emits a single SCM_RIGHTS control message.  Each
SCM_CREDENTIALS item is validated, and overwrites the credentials of the
previous one.

Keep the recommendation as portability advice, and describe the Linux
behavior.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    The factual analysis in the commit message is correct.
    
    I kept the LLM phrasing; it did not seem overly wordy to me and the
    style is in line with the paragraph after it, which also documents
    Linux-only vs. portable APIs that way.

 man/man7/unix.7 | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 4d431ec6deaf..480a565f7d04 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -528,7 +528,24 @@ option must be enabled on the socket (see above).
 .P
 When sending ancillary data with
 .BR sendmsg (2),
-only one item of each of the above types may be included in the sent message.
+portable applications should include
+only one item of each of the above types in the sent message.
+On Linux,
+if several
+.B SCM_RIGHTS
+items are included,
+their file descriptors are combined into a single list,
+to which the
+.B SCM_MAX_FD
+limit applies as a whole,
+and the receiver gets them in a single
+.B SCM_RIGHTS
+item;
+if several
+.B SCM_CREDENTIALS
+items are included,
+each of them is checked,
+and the last one takes effect.
 .P
 At least one byte of real data should be sent when sending ancillary data.
 On Linux, this is required to successfully send ancillary data over
-- 
2.56.0

