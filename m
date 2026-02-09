Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA402EA173
	for <linux-man@vger.kernel.org>; Mon,  9 Feb 2026 21:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770672167; cv=none; b=nuLuBs8udgr2gSCx6MCCy80zLuz0YeE0cCNfYjXxVqDtTR6vKvBQROmuJrUeAbU4ighpfDfaw1EgyUYl4LzHwhH22hpDOzY9/GdRTWZXEtUN5Yy+Gf7T0ptObYsMxdgjZhPHVeOjsHntFep9AkAjB3VCEHhojr7e47BrI7lKJo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770672167; c=relaxed/simple;
	bh=S6nXjY9htyGEyB/mgVY2E6dD1BoN/D1GXmGuUgqzVuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUQJKkI8WPseai3AnYepih1OCOQXDx5v2aSqsH15IOpgMRv5Mf9NgORvgYRJFbM+WIIlquivN53+orY9SMFsIcEpp+irIoATDBTH4tWHMDHcsPr+ayqBBaUZfJCs5+2X1UtcMI6x1/6NgW6cyhQjg3EgOdjJGdd1z3jqA1KQbic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQtqXCDY; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQtqXCDY"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a871daa98fso24046275ad.1
        for <linux-man@vger.kernel.org>; Mon, 09 Feb 2026 13:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770672164; x=1771276964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKf6o5zO4sCua2LGVZOEnR8f4cMeCsztQICiGiCuNq0=;
        b=eQtqXCDY0Kvaw8oO6OJGJ5lf8i+GtIcvTleQgxZJyo5azgJIqiA4yiQrXaBA+EjLLX
         Hr8FNBjIDJonDvm+AtUQE/cOvMIozB3dvurtGw1AFWlgFF1cnSCBLU4tup8JAS+H/AWq
         WKqu9S/ZQe1lq4Yc64U4F4VN4TiOOjrKR3gPtrKABxBkRrVpUpIGNSfqp941Gnfq6Zts
         Xh0DcT6iFlY4bMgz4q1JjLLNjuWD7gopqRKazhAirYIvJX6CQT3UqQ6jMdlw9SqlO39l
         f1Gmc6DMbtSghGsQD60sS9NTI7RTQk/MMDoqitvNijTCtixmbKJzSG/8x5YMWm2z+dmp
         IsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770672164; x=1771276964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKf6o5zO4sCua2LGVZOEnR8f4cMeCsztQICiGiCuNq0=;
        b=qj9rGcWX4NWaOTERaiCtrflZ0meuor6ZLG7hajIKa8wnIxrrH39rGMIvEqezANnKVC
         AdyXhQ1KxRYmpiP/cbPNOwaXaeQmQ1ExuiJiC3X3yxYKRBHBDREKbqLcybClm3yuTtEm
         h+O/FRxHAtKRGIesQI8O8ZI6yXjCuPKEfJLm3PXZ3ROCwpvN31TESm8pJotfLZhPvN83
         r+t9a49jhRPmylhESeYJzlKZPPPWI1ITPlFJokG2pNdqosrLXAeUgA5wkS/BYuBDCNUx
         2V2V+bsHhUBeumdaHpVsaZ0PGpQMToSzbFVHH5MwQakAxagyNbOZGtf8k1J/V/K/lWv5
         BEow==
X-Forwarded-Encrypted: i=1; AJvYcCVWi/t9ixsTIeR6Ry04N4n+DLoXYsqmTRtXKzDi05j2Ne4bfgBx8kkeeVRQ8cigfNd0C1A8UQCF4vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL1LAJBW14zgA2WiHRDIIAnVGpkVcRK18/qsowlfcTLoB+l70A
	dcIFs0+vtflr5k481KSNEBhMrH4LO/nu6RaOGUNbbeSC5t5ufWhDMrhW
X-Gm-Gg: AZuq6aL82acBjE5vOgz9oIGnGd8LWbjNJzjgEYtKbeAXkwvx1TNzPwRCsnkbcPqo3rg
	qyhMmoNJWDJu/SNju+c0dj3jBIEW8CRz5PGRy4muKrXrCGxvQrunIu4oPqfN/z4MhmdjQ58LMhb
	wp5/GaZxj9VkxdQL7ZWFlXvVRz0cZs2mXYpGMSjT9Pd02H2h2+NIiAuRBzLKk4YzOPtwrsxsn9A
	GgSF8Pefpe5SQcJKzDwz+FDMMMDNh6jYzLyEUwuTerhbbIK8SVfKaWaURfY/2EBK+yTh58VF4LS
	ZuAISh55rhJMeYH/kIZSYedLOu2y04KOnFl/DqzCUko2Kea0GqJoDOA/zDvaB5sUGxoAwXTm0R+
	m9QgTHs5LvzutRLMIFquQtt/pkiJh167XYMfzNhI8Z1kRWV4tJxhtpACQH79TOOaiYFo5zEyC4A
	/QHNcwLgN8CYuQVL2mgqwjSMXQEzFnyVpRrfTFp5QMpfQ=
X-Received: by 2002:a17:902:e84c:b0:295:62d:5004 with SMTP id d9443c01a7336-2a9516c4cb8mr143886555ad.26.1770672164200;
        Mon, 09 Feb 2026 13:22:44 -0800 (PST)
Received: from fedora ([2405:201:3017:184:52f5:ed80:f874:1efc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521f8a50sm121346305ad.80.2026.02.09.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 13:22:43 -0800 (PST)
From: Bhavik Sachdev <b.sachdev1904@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Bhavik Sachdev <b.sachdev1904@gmail.com>,
	linux-man@vger.kernel.org,
	criu@lists.linux.dev,
	Andrei Vagin <avagin@gmail.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Jeff Layton <jlayton@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Josef Bacik <josef@toxicpanda.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH v1 09/10] man/man2/statmount.2: Document req.mnt_ns_fd
Date: Tue, 10 Feb 2026 02:47:42 +0530
Message-ID: <43470f57e3a7ffdb7646e32a66b458e104b391f4.1770671863.git.b.sachdev1904@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1770671863.git.b.sachdev1904@gmail.com>
References: <cover.1770671863.git.b.sachdev1904@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new mnt_ns_fd parameter to struct mnt_id_req.

req.mnt_ns_fd can be used to query for a mount in a foreign mount
namespace.

The mnt_ns_fd parameter description is based on this commit message [1].

Link [1]:
<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9020d0d844ad58a051f90b1e5b82ba34123925b9>

Signed-off-by: Bhavik Sachdev <b.sachdev1904@gmail.com>
---
 man/man2/statmount.2 | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/man/man2/statmount.2 b/man/man2/statmount.2
index 0b906a334..e835eb0f6 100644
--- a/man/man2/statmount.2
+++ b/man/man2/statmount.2
@@ -24,6 +24,7 @@ .SH SYNOPSIS
 .EX
 .B struct mnt_id_req {
 .BR "    __u32  size;" "        /* sizeof(struct mnt_id_req) */"
+.BR "    __u32  mnt_ns_fd;" "   /* fd of mnt_ns to query the mnt_id in */"
 .BR "    __u64  mnt_id;" "      /* The mnt_id being queried */"
 .BR "    __u64  param;" "       /* An ORed combination of the STATMOUNT_ constants */"
 .BR "    __u32  mnt_ns_id;" "   /* The id of mnt_ns to query the mnt_id in */"
@@ -74,7 +75,9 @@ .SH DESCRIPTION
 To access a mount's status,
 the caller must have CAP_SYS_ADMIN in the user namespace.
 In case of accessing a mount in a foreign mount namespace (specified via
-.IR req.mnt_ns_id ),
+.I req.mnt_ns_id
+or
+.IR req.mnt_ns_fd ),
 the foreign mount namespace should be child of the current namespace.
 .P
 This function returns information about a mount,
@@ -97,6 +100,15 @@ .SS The mnt_id_req structure
 it should always be set to
 .IR sizeof(struct\~mnt_id_req) .
 .P
+.I req.mnt_ns_fd
+can be obtained from
+.B PIDFD_GET_MNT_NAMESPACE
+.BR ioctl (2)
+operation or by opening a file descriptor to
+.IR /proc/[pid]/ns/mnt
+and is used to specify a foreign mount namespace in which to query
+.IR req.mnt_id .
+.P
 .I req.mnt_id
 can be obtained from either
 .BR statx (2)
@@ -365,6 +377,13 @@ .SH ERRORS
 .I req
 is of insufficient size to be utilized.
 .TP
+.B EINVAL
+Both
+.I req.mnt_ns_id
+and
+.I req.mnt_ns_fd
+were set.
+.TP
 .B E2BIG
 .I req
 is too large.
-- 
2.53.0

