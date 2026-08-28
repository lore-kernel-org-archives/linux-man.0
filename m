Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18601354AE3
	for <linux-man@vger.kernel.org>; Fri, 28 Aug 2026 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933041; cv=none; b=U4HDh3Ex9DgRh1ntky2wjkAv63ot5oHZ2iEj7+ix1jrwBa2h64VYTRRdMJtYefXTH0LGXC/7aIJfhTvqkx0zXu06sqr4CUfFkhnLA9KZeCx2n0mpSjzDc+4V6e7nGbmtzJyqOkQB9puhh6ruxZxzvNfVNQibAHD3IFwHNGc2rvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933041; c=relaxed/simple;
	bh=NaWhHs7THub7glpAaoiW1UMvN8MMdU4fIq9aiAYyCl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pTMP+vgZmkHgDGT3Dso3QA3PGuxlNTC/bzxpMytd4pWtdBXfbypMiN7nvths+SMmAwBO29Sq3TkVnFvqSSed8KDaNvNvxc2GnrWC9XN9M+xH6+PuZ5HzlBzB58YaAMVMQaE/+7qFH2qJFqCQch5+LLotaVgh0cWjcRiCsU8XVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYBSmstI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYBSmstI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so8108375e9.2
        for <linux-man@vger.kernel.org>; Fri, 28 Aug 2026 09:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933038; x=1788537838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+O/waurLusSWcrECTQMYgcIFdagKYqXWvPycuUxyMxk=;
        b=WYBSmstIK9I8huC0TMCPY15asoA8pMUGi9pcraSqqsl3oST71DIawu3BIpob5ytpKW
         tCHLr8rZ3KNT1qdurll4nM6ccREyFzEbMJyZICbY24XKV5er0AQJSi16B131WG0DuDYu
         sy6k3znGdxM/nMcyt1Q7n7VixS4lxL8lJZO5x5kM3fnVpbJxYITF2qWjfeWDuV4i6nfb
         fsU1zueRwhr1vYCPWVnYm2bzvVYA3dYJwc5KPV/RxIvoc6bmhLFzmkuoVgbJhfKbN8oH
         iW4wjfbq1ea9tGNy7PtMBdQhuaLGC3zbo5JvVTsQcLZ/SEjJFQB50zS98fv/0x1vw/Vn
         v+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933038; x=1788537838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O/waurLusSWcrECTQMYgcIFdagKYqXWvPycuUxyMxk=;
        b=PD0SUCA70Ov1WzoMF3M1m7Ql73Fq10zSYpohJD/xeo3oYNllRo39nthLmIhQnxVG7H
         WlB5xra9StoTObWsQvvvMrUdY+jSdATuN+047QINxAVujEn6cpS7/n6swmOue1SsCLvu
         hNGzsNGwuXgkVRakgPx2RDZt4wbEUhpwrw1lXkjeac0/2bqMnD56Scjx2yQi5O2A3q+r
         kRFNuN0KC4SoBDg0mKVtFm2x8SVuTAeGHvByEQinT68m8xJCSzmeRsWR4bk7F8fhDqV2
         nkG0Cf/uLQWLDGXc2JSgHMeZFVzNu38IVLqz+XMQr7+vBgjeZC10I649aMkgVSyjDbCG
         WN6A==
X-Gm-Message-State: AFuF++kqGIZJUNtywV1lyZCizRt+ShyyuoYxJ+KL8bezkm98I26JZufH
	m9JwbF+qhHoXJ9SsccEe48BLMju8fC1+SSMWhbleFcX5nks9BL8F8uKt
X-Gm-Gg: AR+sD11wYlVtdrmR2GuLgtxV5KMVQgGN94nfVm7SCxvPfONb4bN5uPpy7B8lvfjJJkg
	HTvBb5PWa0qU2z3/yfz1HrXjtPY9uZ/Kys4F6mfnONR2y2wn4O9LYEAXATU0M8GoShKbaQCGFpv
	yyoGy8bgj7daTINF9Xqvnn5f6QP7Q6Wf3MdMigIONqrwmDzR8jYlIUomPuHgPMsNPWmQ2IRPgQF
	xwKLSYQRIFlWOdRCob3mLn7jBp49JfBXNZgQuYei/yNbCh5aA98DhI5BzgMue62pR96UFsK1/jn
	kMw/LgDnhuvKHqlA/jJharHDqe6VcznJbWWLlZNGrM3r0lt8NHhU9dzntfMdb/U7P9AlEvYOE6D
	EvfrlWLgi8eeee8rNTLjbk3ipBSGkpoW/Uj4+PfTnh8m/gAwEzbyKQf6TXjgYoHr7p0rV0k7l0a
	uC3sVkVtfSsLQS9pnXo32S2a72FjScGNJbJJpk6Tetsw91gRemwLXQ4MuQqEACMohksmArKitLi
	KjSVC+VvFla2Q==
X-Received: by 2002:a05:600c:4ecb:b0:499:d95a:44d with SMTP id 5b1f17b1804b1-49b91bd885fmr124553015e9.0.1787933037940;
        Fri, 28 Aug 2026 09:03:57 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm70145155e9.4.2026.08.28.09.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:03:57 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH] man/man7/landlock.7: Document whiteout object peculiarities
Date: Fri, 28 Aug 2026 18:03:41 +0200
Message-ID: <20260828160340.11238-2-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bring documentation for LANDLOCK_ACCESS_FS_MAKE_REG in line with the
Landlock whiteout patch [1].

Link: [1] <https://lore.kernel.org/all/20260813093157.1436894-3-gnoack@google.com/>
Link: [2] <https://github.com/landlock-lsm/linux/issues/66>
---
 man/man7/landlock.7 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
index 880dd50582f3..3642a64ff1f6 100644
--- a/man/man7/landlock.7
+++ b/man/man7/landlock.7
@@ -204,6 +204,9 @@ Create (or rename) a directory.
 .TP
 .B LANDLOCK_ACCESS_FS_MAKE_REG
 Create (or rename or link) a regular file.
+.IP
+This also guards the creation of whiteout objects
+as used in OverlayFS.
 .TP
 .B LANDLOCK_ACCESS_FS_MAKE_SOCK
 Create (or rename or link) a UNIX domain socket.
-- 
2.55.0

