Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3723D88F2
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345040; cv=none; b=VoY3CHeBerKWgffayPXChwHCsK/+ZfGEL3EEBoXD5Gv/vHk1DErxRLKv4u+yLoKuHEh6a6RFvMiMZMaR6gv2a87Y5XTuG0bbraYcD3tofpYzEYK7CAvVR1C/Z9VfLltmQKfCD1ZEW4jTU1j5ssCxnwaNnzXjdTDWFVTLi0smqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345040; c=relaxed/simple;
	bh=g2QReDAeAHV7F9+0QRJu91rCFWE9c/LtJj6YMFe8NwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tKlmxhnopUnzbqXhXwHmXZGfpZzNIdAGEigQdFcg3aWY93fsPy1Oc3IGi32oYsWe6b5GskTJ5W8QBA+cn3JJ7rzobU8vlM4rcO8VLP1vHnF3F+V6+oyGMLcFQD27yfVneTQvT6/XsyoBlyGNgkRh6E0Y/ah3ABezj9C9u8UxI/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEhnqkYA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEhnqkYA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d870d54so784793f8f.2
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345037; x=1792949837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+Fb6ovpsMoOaRnc6EhJnJBqOmZGrprBIh8IfqkWvJw=;
        b=PEhnqkYA89BBSIUI1n+oNNGwnxi86lR1ZqXTzXfpTyEufJaQYsWF0zfRIfvRxiDnFH
         tNmdDYjD+G7U/4657OB+S7Zwc5GVh/EO/LpPZZTgT8/VKz+q2hVcUPoLqmhodyQyYKcE
         qi1opp+FVFuluMC3lPK+5FYF9rZZ+JvqxziwMXw1zCLuMJ+nQLVVc08CNTrL6vJl+mhP
         Kz/y8r/F4maxPSG301y7AsXpMFUElCu6ipu+NsqbKw39RKuE0sv+qFLvc3Nk8XMErY+T
         D2Gwi7EqO2fbBS8T5NncVqm1SjBny85+9zEN1dYB3EXc5SYUV+1ukaYhYU2I5oaJLAsn
         YA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345037; x=1792949837;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+Fb6ovpsMoOaRnc6EhJnJBqOmZGrprBIh8IfqkWvJw=;
        b=swg4/EImVWI20QghQ1MVxfSNmusP/U3q8HELk2gjwRTAyGI0pHdzIvcOaGZ6l6ArMB
         1vpKwebGf2tJ8f+CfqQfNoRnAafPNi77zB1GLudgWZeZelhLjHnE9+zRhCG5nIHXoaJ0
         RXmN+EgVgETxM8B/NyCA81A/6yQC8c6hBaiIi+n4O2/Ct9sTAhd+ilIkHxszsF0iG3XC
         1vKWjIYd953v255nBQCQHCAwE19YXDnlnzfvJwnu5kS+fOjPhSFguNVyLSWOZcqWyShp
         31Jvy2ZLTkaXR6thYLBo+YLpqrOvDvJiP9r0S31z1QSWcQ/tiCmHW2Te+BTLKWwNZfEf
         8PJw==
X-Gm-Message-State: AFq9FYJks/+n522S7JaqIu+RZ/BKH2h0PtgVprVvzBbSCxatxI2XFDiR
	rd6fpFKHbFTPD2FMix55/JUNgNT82/YvPuN+P8qTMBdLb9FSuOHjm3NC
X-Gm-Gg: AYBFou25IKFY4Vh4FxFGD8kezfRFQQ3LL7m+KO7DyiaU97rpIlW3QGcnd6Xe4eOxOSj
	Qofj9Shub7zaiT9K25t3CvOEw0ZYIItnqmvDHKykBDHcNVvflTWxcjUohinys8hth8SRNUKgXdC
	BdI9rLf8gKizlsfQ8vk/t4wdciCwKS7BucdT81cG+1bC9rnJFumxGz3IDtLTNujEBv+t4HDXkGj
	3cf9AxBn+q8nKvVNYS15WOc9OI6UYRAeGiA1m28mJzV/RSxDXl7WC/z0FsvYZDMxitmc5zNJMps
	sZT+XCfBYoJ/na+BfrAdsGySZf2P2Z+iui97X1u65TZ+m1iC7EluGWDBHubycwQvc6sgSGrxIzU
	p8NQTDKNdGvKwvl9oeI/HvkuJkBQ84F/Si/7oz733Mn3XYOKv1NUha5tmK+IJUCO1SEFa80tJIY
	7hW6uOjmGeSzgLFcoo5eNOg5e7IlF8RgSyOoSPHp0QYMFmFSQWA3aIKb6JoHU8OSy411kuGpS/H
	G2JczAREd2CzeO0FmJ/D8w=
X-Received: by 2002:a05:600c:1394:b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a1d7600163mr112765615e9.21.1792345037302;
        Sun, 18 Oct 2026 10:37:17 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e7657d4dsm21659415e9.2.2026.10.18.10.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:17 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
Subject: [PATCH v2 01/24] man/man7/unix.7: ERRORS: EINVAL: The address field is sun_family, not sun_type
Date: Sun, 18 Oct 2026 19:36:49 +0200
Message-ID: <20261018173712.27670-2-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018173712.27670-1-gnoack3000@gmail.com>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

struct sockaddr_un has no sun_type field; the address family is in
sun_family, as described in "Address format" above.  The check is done
by unix_validate_addr() in linux.git net/unix/af_unix.c.

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
---

Notes:
    Fixes an obvious typo

 man/man7/unix.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man7/unix.7 b/man/man7/unix.7
index f9db05a71d93..75e125c61673 100644
--- a/man/man7/unix.7
+++ b/man/man7/unix.7
@@ -663,7 +663,7 @@ Invalid argument passed.
 A common cause is that the value
 .B AF_UNIX
 was not specified in the
-.I sun_type
+.I sun_family
 field of passed addresses, or the socket was in an
 invalid state for the applied operation.
 .TP
-- 
2.56.0

