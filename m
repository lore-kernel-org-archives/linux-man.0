Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740B740DFD5
	for <linux-man@vger.kernel.org>; Sun, 26 Apr 2026 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777202246; cv=none; b=vE6drXzEANGCZ9g3Bje0hPKgYY0IFDVyvBh6xJhpmjn9gPB7+c7fVK4KlVcBxBsCSB3OWwbuqCcd5HrWjGuYWm2IK1F1JoyRb8Pv0HRhDGLEj7ZNifFlT8Twp/g2IY/UBIrp6sJpOtzXnpfgGLczf/8cM6eyXWJBumlRlOSmMUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777202246; c=relaxed/simple;
	bh=7726hGaPETNwMEpkAhRiIYd2F56132UVqjQSFjmkJtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8vSaRZKEBEl2ulBsEBf9pRm2b4YSXgwVeFSwGn/E2YLZj7grJCckQOqeWb0HQSxi+fOLJefDj8ZkQxryhhlN+7LnOoL8EMFjUGnzVqOPFBz2bRYZuE0+visHMWmR75DwawmZrK4kJ90N6xNZQggo7mCxKdby/394rzFhqGfDVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmVF+Auh; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmVF+Auh"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35f9ab079bdso6145119a91.2
        for <linux-man@vger.kernel.org>; Sun, 26 Apr 2026 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777202244; x=1777807044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6g2gIJZyNDmQelxYp36FkpgxB24YNTgJDxgK8xtghA=;
        b=TmVF+AuhgJKYQ2DtmN9RB8vfW1+R6QfN5yvDwtgbaUnOuZBEnxtlCFUSENANuVXJYi
         86/+g23vLBPt/M3pKDrUIL3iM7jQht6UbV1n4hMWd9EATnq/7eNyd1IWl9rI6PLhWmLf
         QPx6TQXiQwpwhUe79ol2hsaqZNTruuVYwo2WkJcgbVwsG9ObOBJxeB9XM8b2XEYUrpig
         mbuZxOQ8L5KraeD4e5WS8MVO3Bi928z8mkMPvxZLUD8gSwtIJtI24Uk5oFs/5vfl9ctM
         jzGSijJYlyQDTv9luCLCpcaugs0jdwKqeaK+4JrIEt/7DhBzYCE9pPrOLokJYqnEVjFi
         RgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777202244; x=1777807044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6g2gIJZyNDmQelxYp36FkpgxB24YNTgJDxgK8xtghA=;
        b=TBwAqyBOr17QOQNBdxAXE5VdbpR4h8pKj0bXw50CHYEZ72K3WJdeQZl5N8vkDsySHP
         gdl3+i8D4zx8M4JfdmR/oP8I+WIya1+p5csuwZtFhswX3yVIY9R8je7Id8hayLFYr48y
         yfJ4wX+/uYeEfkXRE2KPj2BSBbxLxCEPfVS1uUUTQD2J43Fvp6XDLYm9xmXVDLP1IZI0
         DH2+CKB8whOz8dHGfT46bSUjnLG/h7o8HxaGVIiJQbBLRDzxbfqR4uEx5NNZxnzLQZSa
         EwXxXjAzFhL3jHqtk5dHb8dLiXvhUXp4MJD68IFV5H5vSx06+uB5f3RnC0TO035ghYgc
         ZkMQ==
X-Gm-Message-State: AOJu0YxJqGB6YjZsxSed7hwdb/+TTyT1V9KXyUbqgqbbCxrd427utBC7
	0Na+YRxF3rdOQ2CIWb5TF26LYsLGl61+djMNxs/xb7DqOQcVCSc+vQF/CS1b2ejIfbo=
X-Gm-Gg: AeBDievrordbzXLaSIZcnwijEWK0L/Y0d+b4McCDX1eoo1MLyh7K+CAsY8W/hDYU3k/
	LY4m8dmBD+DV9OfDXdifKKrgAcS+IpwKXEaglOioy1xlvkzRjTmrmYAAt4LIgSVcZaRVIRPq5Ct
	GE0KkSyWiJBNB8l8WMS1afMCQWdqYkbhFKBFJTPGRgVkZpjqMGiJDOM3vr1AJr390D3nENrEok8
	fCaYgi3R26ZE28JcJgvAY5THDKsJ622ewpdrU/df7fg9bUI3cpKtB8qLeZD9RUnnTF7jvLOP9Pj
	IH7tEJIhCQ/OCUrD46cN3zAVs8WHYSEgBnRM5nI59TwIG5r+Vtc6uHXrlvifjPIOK+lN0DeVyPT
	ZfO0tyl4+A2WWwcW+Lfy6xWKYJ4HfkwBc33aAaGllIr5KB8IbOi46llauFU/uGUEV7N/Ac03cAA
	EvCcoWX+PdBMgz8GtnoyW+xJlt27GSK0get+hsMvlmOODCJ7xa6iol3sUNvfTU/vgRBA==
X-Received: by 2002:a17:90a:1217:b0:362:bd99:8813 with SMTP id 98e67ed59e1d1-362bd999255mr14848872a91.0.1777202244475;
        Sun, 26 Apr 2026 04:17:24 -0700 (PDT)
Received: from toolbx ([103.103.35.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614186adddsm30035080a91.2.2026.04.26.04.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:17:24 -0700 (PDT)
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
To: linux-man@vger.kernel.org
Cc: alx@kernel.org,
	brauner@kernel.org,
	jlayton@kernel.org
Subject: [PATCH v2 1/2] man/man3/errno.3: Document EFTYPE error code
Date: Sun, 26 Apr 2026 17:14:25 +0600
Message-ID: <20260426111707.36541-2-dorjoychy111@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426111707.36541-1-dorjoychy111@gmail.com>
References: <20260426111707.36541-1-dorjoychy111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Dorjoy Chowdhury <dorjoychy111@gmail.com>
---
 man/man3/errno.3 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man/man3/errno.3 b/man/man3/errno.3
index a070dabca..ed3578b07 100644
--- a/man/man3/errno.3
+++ b/man/man3/errno.3
@@ -590,6 +590,9 @@ Invalid cross-device link (POSIX.1-2001).
 .TP
 .B EXFULL
 Exchange full.
+.TP
+.B EFTYPE
+Wrong file type for the intended operation.
 .SH NOTES
 A common mistake is to do
 .P
-- 
2.53.0

