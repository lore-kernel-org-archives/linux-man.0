Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A1358B6A5
	for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 17:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171976; cv=none; b=IKoSEG7hEUxLFGdpQWgqre5NRBbi8W/taqnkpu6S+Jdla/c0c5n3wLbig2om72XX03gw/l1Wbfx8I9kiRsuNILHYx4Q6BgeZLocgWSenL9d1MZtvgTOv16PuFaPRTesSCHDGeD48FzNu7eVk+Qk6CIJjFJKFQK3aGNHRzSJN+sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171976; c=relaxed/simple;
	bh=QVNP8L6a1pjszZD2UEH6qGyCXKGFqjVbxYIqMA5ixDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EUcWuJQu2waYd4fXZcOqujMO1UDc/sI98h97bYQqlFi6xiOGQzEfxvqSsiN23g4uCnPPSLPl80IOuO4bsjQrqwTnOiolnmqN+kRTbd+8u6P029HOVzXVZza+HG6SFkKMN1oVWqeY66i2w4vT4XboeJt30u+L4jNXfJUvEHS4vp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlVOdBZz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlVOdBZz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so1872505e9.2
        for <linux-man@vger.kernel.org>; Fri, 16 Oct 2026 10:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171973; x=1792776773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vd7aIzJgeSAwFU27nLk8lgVxc00eNARHwdMlwSLFYdc=;
        b=FlVOdBZzdzbguxwLeYHfCkl9oTCLshyUKb2VDIP0blSRuE5I8FxF1QXDBojwNEYgzf
         nEVkqrNpgYALPwiQid4VDyvRmni6SALQPrQnjE5pG3GHY3FHD/7Cr4LKNxu6dWxVtrMU
         77YGXLAUmL3h0aqfp2xEBzBd5hlD+KCrKm7YEJ6IQhs7csgrFxA2vagGqL1ruM62bL63
         2rnXcwjGNfZOVDg+LePmb0x4J2GGDH1kkZ+oeiT1l5hwgDHzn4rgGho9AEB90b1lU9uh
         ++sRwLwOw184UEQaygaSMzcZ0oe6Z0rceW65nGsv+KwNLSTEz77YMSca/LAS1WSb3Jtp
         lLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171973; x=1792776773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vd7aIzJgeSAwFU27nLk8lgVxc00eNARHwdMlwSLFYdc=;
        b=169YYOQLdvVxPs8jE2wWOD7P763PBdO4qHB7MxHVxZ5eFRvPcX9QksY0xJ3MVfCjYL
         EON3hmqyDTOK8aO4GtfsHhy6aF4TRDiaTgmuURFKDLNFAZUaW8QpJ5GHxQC88zFBnSAw
         m4xpZNbxxbG+Y9G5yWWM3VLLj2PXTpDdhMU8Tb0TRIGrOkNevJmlnbsg7maa9De2bGru
         hR4xHOvaWfw6tQwr1AOR1bcXUkzr2/mxbD7d2+1eVX87mstpr7xvRsxDnRJVE2uoO1nh
         DzA/Lyl/R0iJzRomAz1emgtPtO3tl/iaXL0+Aj6ucCT4T46PfNF0ZyTv3W8cIBQf3NXI
         KNLw==
X-Gm-Message-State: AFq9FYK11xbe5AefAXpX4pmyGv/1Dll+k01bed40DYXkiwUWp5N2cm3r
	WbM5c2XjFrZugqSlhzptCczR2KpLYYUfatiWKkoY4bwXs/IqIhJyZLhP
X-Gm-Gg: AYBFou2EZv+FYZGRM9gr6S7Q+f6xqiwvOm08w2Sbs0GCXY3V/f4QeIi2q0PxDveSBQW
	3BYSzzuGiaWOt/3S1tJulycCPWXkyIPifebH7q3B1xQH+DMVrah/yqP1cOzry/mVRfNDiJZkCq4
	JmjapBsU9GXIelqTT0+AeO574VZWLf6BbGbpRN0jJwaWORZ/4tHcZ2XTDwKIJ6sG4gLdsxmJKME
	ER1Q+RY5FDKDL+9/bjmfVu4qaBbphWnvphl+wk6QmzHZTtrchn6wQhcLKdaTURB54jOV3i9xCVv
	Pn+My8aC45VnuFSwVVI0ehDW2tdh4MGOAIFEz+I+jvx3Dqyu2FkzSjwlkLWCJlrfXWT/u9jC1f0
	b7x7o+SbN69LCwKNqmdMVr0FBLa2Qp5hnDeU2MYq6FiMOZQG4ID57joCkz3H+0f7AVb+gk7FHyH
	63MlfB3mSf0f7kfncHV9vVXVgyW7iNZHIIR0p994DsCtGoncvBFpDH91wY+1AKf2AYhx0uYLUz9
	JsX1mRohr9M55nxh6gxvik=
X-Received: by 2002:a05:600c:698d:b0:4a1:d767:ba33 with SMTP id 5b1f17b1804b1-4a1d767ba47mr10345215e9.12.1792171972846;
        Fri, 16 Oct 2026 10:32:52 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ae6d2esm74591065e9.6.2026.10.16.10.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:32:51 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH 07/24] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
Date: Fri, 16 Oct 2026 19:31:22 +0200
Message-ID: <20261016173139.13076-8-gnoack3000@gmail.com>
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

The ETOOMANYREFS error is detected in too_many_unix_fds() in
net/unix/af_unix.c when the user's (not the processes') in-flight FDs
exceed RLIMIT_NOFILE, and the process has neither CAP_SYS_RESOURCE nor
CAP_SYS_ADMIN.

The check was introduced in linux.git 712f4aad406b ("unix: properly
account for FDs passed over unix sockets").

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code -- the condition under which this error is
    returned was not fully spelled out.

 man/man7/unix.7 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index 9df4d3b6f635..86e72d0f58d4 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -732,10 +732,14 @@ when sending a file descriptor as ancillary data over
 a UNIX domain socket (see the description of
 .BR SCM_RIGHTS ,
 above).
-It occurs if the number of "in-flight" file descriptors exceeds the
+It occurs if the number of "in-flight" file descriptors
+sent by processes of the caller's real user ID
+exceeds the caller's
 .B RLIMIT_NOFILE
-resource limit and the caller does not have the
+resource limit and the caller has neither the
 .B CAP_SYS_RESOURCE
+nor the
+.B CAP_SYS_ADMIN
 capability.
 An in-flight file descriptor is one that has been sent using
 .BR sendmsg (2)
-- 
2.56.0

