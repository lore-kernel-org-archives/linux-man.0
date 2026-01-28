Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730F21CC4F
	for <linux-man@vger.kernel.org>; Wed, 28 Jan 2026 06:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769582836; cv=none; b=m9hNkRhdgc18ZWBTcVMoPQP+ZOzjrCamhWcX289wUdbemE0MrjCTY6SqA9V+OYevVwe/pZNevzfBCByEe3WkoUYgf0/Nygk3Bo53TZsVj3m09zFkXwvgMD1qsAi3eUP4gUQ58Anira2lWPCSSWAcyHbYXyC7IUj1fTxQLPfUAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769582836; c=relaxed/simple;
	bh=tUtlQMdbvC/znhdQGu3axcuE84WVkncCv2bXvjYjpr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GgJrq4PJUoCF40oQP2r+Kdb5+zEn5459oAxg3g0MHea/NZWBn1ouD4yK0pELFtF65ixjIeVg+Vf2/otFTjJDMy+6fgLmnPOpUEeNz6O1Yxmc75Z3AqabeZiPyWGRFzjvvYLm6XStCinZLaHZS9D7mXrfCa41u5BhvwXWhV+XsJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPOWh5cU; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPOWh5cU"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b729f4c154so11376326eec.0
        for <linux-man@vger.kernel.org>; Tue, 27 Jan 2026 22:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769582834; x=1770187634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MLT3aNY/Dl5ancKSK1yW/sDLoXfokvFzCp/bcAyofRk=;
        b=lPOWh5cUdzO7J5mLg8w516HqW1AA5IsPllO9bkjThDNBRi74gJpvzD863bVoWD1yhP
         +Vho6ZMx4aMhM6ScZ4SEHRCzqh5/f/E5WKXT8HoCMRSpGzcxvJjYO83PKFEK92wiqQMU
         +QfEZ1l8e5U4kJw08YryrEDXxJITsECD9pfzMH/nVeMSo5i/+Wz72YWu8trj6FDCLKVV
         +tSeVfVdXnTccaLvOOKisS6I/vfYgotblhIRca9UWPGrKQXNfAvRmateV79zJCYglnPQ
         ZKCGkKJMe9U9WUHqUCGs9t0cOxn6AoxLOzlEEJ1KldJp7HgV9WpCP6IRW78ttA+5fwj8
         MFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769582834; x=1770187634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLT3aNY/Dl5ancKSK1yW/sDLoXfokvFzCp/bcAyofRk=;
        b=AiCPyZsTAZUD/yuWNm4C/NtiaCVe4tyC5GAnfP+fXYwvvwb7yLYQw49i29MsNPGxxP
         jctlrKhdbmPpQlQAusqgahmEWuSATUehQ8T6VwslY90swnYsws7Q6/Xl5DM8BPdbR/zU
         kdx8yO68fhF9UB+ezMSLW8gJVh0lxU///H9dWuhixwoBhqMhNSwyAcC00ZFGmSFmyJrK
         LEXNt5PpORtlOx0gVZc1D5H6uBNZ2rHTD6FBWNIneEeEYC7gg0+SfRA2LltfmXDlP+43
         eGDicaKglHkg8MmpitdEoNoMAIoILKLz8TOwPlu6Dwjh48x7616Qhg72B4+loX9LIyZU
         aPIg==
X-Forwarded-Encrypted: i=1; AJvYcCUVWOlNifijdrLbUQzKZnGlDOjWZ4LLXuC3qI2hz3k8YD58n+AMQrycUex+YBDEsmaMQY8MUIISNFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEMS1VrAp2XoTbqQ6Q3Ulx3KCPlii46Y845elVWs5RY6X9fAfv
	KwghqmT53mYkGnOl46OzyWvoPamVYH0Jd+QTbR/hB2GfZiDPthB81yd1
X-Gm-Gg: AZuq6aIKw+kz8RIWcbBcM5sh14izof2M/ChiJNbyeC2FCDxbdy/6tfWpB03e7wWHLkq
	litl4lIn/N6Dy95W4DWVScPyFtOGUvZQIFEl2Yt05Dwmv8zgsFC8Hxv3GHWTSXRVZx++mmsf7Iy
	NYifktAyit51Majm9YtC70ezqK2gRArilMDsNYiK4GLpigIgLndKty9Tjmqz4b6eWrqPsrRWysg
	0LUqspYDNaElhRhHF33INvN1vZzSbjVBc9OR6bjcYIm7nefEfRW4r+FLwwSHEiwGf6da+nIkoVu
	DS4lRIDTGC2dYCOyuKwvFf/XY/BScjqjQSSX/33UCBujCm+oDcyfFD36ZbknmUYWGWGJq5qqvH4
	cmGMBXR4uNmGpFaMCOadjFpfNkXFrJD/6agrEgZsABNJhsnN0BLll4LkQsZEi/2gSX2GCyadCv4
	OnTrRKviIEB1QmfR3U51E0t/UXNB2U
X-Received: by 2002:a05:693c:2c07:b0:2ae:6146:37a8 with SMTP id 5a478bee46e88-2b78d8cb642mr2678890eec.2.1769582834465;
        Tue, 27 Jan 2026 22:47:14 -0800 (PST)
Received: from kira.gmail.com ([2601:646:9e01:94:8c26:9671:d3ab:40b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8a7bsm1364583eec.34.2026.01.27.22.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 22:47:13 -0800 (PST)
Sender: Mark Harris <markh.sj@gmail.com>
From: Mark Harris <mark.hsj@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Mark Harris <mark.hsj@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH 1/2] man/man7/feature_test_macros.7: Add _ISOC23_SOURCE, _ISOC2X_SOURCE
Date: Tue, 27 Jan 2026 22:46:23 -0800
Message-ID: <c52b599edf72f3e536ff6a5b846232ab15bc83d7.1769581650.git.mark.hsj@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_ISOC2X_SOURCE has been recognized since glibc 2.31 (2020).[1]
_ISOC23_SOURCE has been recognized since glibc 2.40 (2024).[2]

[1] <https://sourceware.org/git/?p=glibc.git;a=commit;h=777d75fbc07b>
[2] <https://sourceware.org/git/?p=glibc.git;a=commit;h=42cc619dfbc4>

Signed-off-by: Mark Harris <mark.hsj@gmail.com>
---
 man/man7/feature_test_macros.7 | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/man/man7/feature_test_macros.7 b/man/man7/feature_test_macros.7
index f0d4a51f2..a0c97f2c5 100644
--- a/man/man7/feature_test_macros.7
+++ b/man/man7/feature_test_macros.7
@@ -358,6 +358,24 @@ .SS Feature test macros understood by glibc
 .I \-std=c11
 produces the same effects as defining this macro.
 .TP
+.BR _ISOC23_SOURCE " (since glibc 2.40)"
+Exposes declarations consistent with the ISO C23 standard.
+.IP
+Since glibc 2.31, an equivalent macro named
+.B _ISOC2X_SOURCE
+was recognized
+(because the C23 standard had not then been finalized).
+Although the use of this macro is obsolete, glibc continues
+to recognize it for backward compatibility.
+.IP
+Defining
+.B _ISOC23_SOURCE
+also enables C11, C99, and C95 features.
+.IP
+Invoking the C compiler with the option
+.I \-std=c23
+produces the same effects as defining this macro.
+.TP
 .B _LARGEFILE64_SOURCE
 Expose definitions for the alternative API specified by the
 LFS (Large File Summit) as a "transitional extension" to the
@@ -692,6 +710,8 @@ .SS Default definitions, implicit definitions, and combining definitions
 .BR _ISOC99_SOURCE ,
 .B _ISOC11_SOURCE
 (since glibc 2.18),
+.B _ISOC23_SOURCE
+(since glibc 2.40),
 .BR _POSIX_SOURCE ,
 .BR _POSIX_C_SOURCE  ,
 .BR _XOPEN_SOURCE ,
@@ -876,6 +896,10 @@ .SS Program source
     printf("_ISOC11_SOURCE defined\[rs]n");
 #endif
 \&
+#ifdef _ISOC23_SOURCE
+    printf("_ISOC23_SOURCE defined\[rs]n");
+#endif
+\&
 #ifdef _XOPEN_SOURCE
     printf("_XOPEN_SOURCE defined: %d\[rs]n", _XOPEN_SOURCE);
 #endif
-- 
2.52.0

