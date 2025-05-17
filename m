Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946CC1DDC2A
	for <linux-man@vger.kernel.org>; Sat, 17 May 2025 20:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747515211; cv=none; b=uJYCni2/g1BUKgCM6eOOIbe5bTuqnb7bg43lWNthuQlPJZv9+r21CA1ThU8tH6OFDh0gDFVeRMAj5D2IJ/QRETTTgauXwlgjdfTe8F9Sdp11SbZlrKQHNY5Kdkw//z4AYbWIUw4l6NGFr15mUqV5rSgv0jQcHUB9h/fdnjM7y7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747515211; c=relaxed/simple;
	bh=1lAkx4wXRK8tzFz7OkEApqphO/51uld2Gg5/u9jzkG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAYGB/kO05sUoxegRV6oV1l8dNnGQSzjvbfMFnby2C9qe+yi25UZU+1u4p4/xlPl+AKjdA2/Gr0fwPtyiuTzctxjL9gCOtngpKTpGvK0QtYgQGkLjJK5kn3VYUR0tHgxei3s/VafmRtUzMjWvB5eWL4GzlK+yLlSdVNkYSSjADQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeDa78j9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeDa78j9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2320d2a7852so3376195ad.3
        for <linux-man@vger.kernel.org>; Sat, 17 May 2025 13:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747515209; x=1748120009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukZjwrBI9UpcJiuoYUsfOaIz0freRyb+m4IxlKkgRtQ=;
        b=HeDa78j939AKXD3cGrAs8/+Fk3kMA3K9paquwOY0h4+pvfUkQYCooYcER9Ue0byZEb
         tozuKXNsFYa3QevgGhCCuk918n2CmrFfiYec3UNpwZRF2HnHZB1O0PPKhpU8Gdz6s/46
         EzUs/kHzQ31HD4af48jhTK/N6Pc7QzmxPD/tA0joXwVgS0wzxDe0kDDP1ami70DBMJXi
         Z7cyEbbrz1JnvpI8x0uoCSe4EKw6q1suZULtSmZ7fdMiodtqRfajh3OAGOHTRspTeJy2
         svXXswJmX8EQwcLWcbvG9Bk8k59jXf/mAiqfT7O6TMBs+v5RVXSO2gcrfYGCWDGyDUon
         nOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747515209; x=1748120009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukZjwrBI9UpcJiuoYUsfOaIz0freRyb+m4IxlKkgRtQ=;
        b=jz/q0h+lDaTnwa798WObvHwQGskZSqhqEZaOsiA4r1VUGLVrIdaZ9jjF8aDIlv0kJY
         V1euG/At9XqpzS8azYQukBRkhNQIZgNVf8D2icmHfJ4NaY/X+ztSlxuOPdAe+8dJn/UV
         wiI0tmf1ocQCrpN9rlKzzX30PGVc0Iz23PMFqicBCGpuHKFBWSR3+hkIbhD3E7ac/Tfr
         iHKiL3SngPe8yWggXD4wE3gc/xr08aFW+rAc9kuXh4JUWGtB7YbusbUAg34f3tld6eAV
         bn3i5dQH6fJ+Glee/rESOsqE/GfkEcn28DoX2QkAeMt58+t34Eru9H7Qi4U39DshGehY
         Icdw==
X-Forwarded-Encrypted: i=1; AJvYcCUPNnoQmRQBZnYfdkAbe9V2NnWF+RwqrD8JOwfzr34y21mRavGfgWazmAnmCxGUB1fuY+bTNa8ezkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoOFY3akd1xWThFnAVijJdFgFLHoXqh8SOyDvwcwzVxvZ9PxXH
	77QYurnWHKCkFWu/G8tuxxCtuUpYNbBLYCoamicYQgsCs/wLB2c/1TMX
X-Gm-Gg: ASbGnctxi1CYEM2kQJgGgKYm/dPgqmEM/98uwzVbsGEwVEJyIDEowVB2lCOKm387wMW
	FPEbdUru1588ViZy3rwGcNA2a/O1oz1vdO6vICBNVvXcUWDZqNMAnO1oiKdckqL4VAuS6l4+YYf
	e+vG1CrGBBVAS5p10wdF559lxaZ4i9vcBnLtAcCLo2V80fhNLgTkgsk91Dc4wupw2eySz6lq/o4
	inlEzjJP8mf+KbcSDp/xHH3+SHD6cq5qmrkmg5QoHuzs50L/FTytE16XmeEvHfNYg87SMwviz39
	nR3SWXgwJt3WWJzTUJDSo/OvqeD7shPunR6CA9ilN1h2
X-Google-Smtp-Source: AGHT+IHUceh6LXCsyl3ObrhQchAovrj4WBk2RQkB8rLL7+Lczu2Oq/nhRxFGJVKqM5QAKj6/NpXFIw==
X-Received: by 2002:a17:903:32ce:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-231de375e8cmr83568905ad.27.1747515208724;
        Sat, 17 May 2025 13:53:28 -0700 (PDT)
Received: from fedora.. ([2601:646:8081:3770::9eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4af1b75sm34567835ad.85.2025.05.17.13.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 13:53:28 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Collin Funk <collin.funk1@gmail.com>,
	linux-man@vger.kernel.org
Subject: [PATCH 2/3] man/man3/getenv.3: Mention secure_getenv was standardized in POSIX-1.2024
Date: Sat, 17 May 2025 13:53:03 -0700
Message-ID: <f1cc4b34bb42b09ae9c0820df8fdece6fcebfcd8.1747515178.git.collin.funk1@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6abbe99f5e8710202650bfee5d41e6fceaff4d1c.1747515178.git.collin.funk1@gmail.com>
References: <6abbe99f5e8710202650bfee5d41e6fceaff4d1c.1747515178.git.collin.funk1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Collin Funk <collin.funk1@gmail.com>
---
 man/man3/getenv.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man/man3/getenv.3 b/man/man3/getenv.3
index f05e3eda5..8285dfc21 100644
--- a/man/man3/getenv.3
+++ b/man/man3/getenv.3
@@ -36,7 +36,7 @@ .SH DESCRIPTION
 .I value
 string.
 .P
-The GNU-specific
+The
 .BR secure_getenv ()
 function is just like
 .BR getenv ()
@@ -88,14 +88,14 @@ .SH STANDARDS
 C11, POSIX.1-2008.
 .TP
 .BR secure_getenv ()
-GNU.
+POSIX.1-2024.
 .SH HISTORY
 .TP
 .BR getenv ()
 POSIX.1-2001, C89, C99, SVr4, 4.3BSD.
 .TP
 .BR secure_getenv ()
-glibc 2.17.
+GNU.
 .SH NOTES
 The strings in the environment list are of the form
 .IR name=value .
-- 
2.49.0

