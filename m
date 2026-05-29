Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B9C3E0758
	for <linux-man@vger.kernel.org>; Fri, 29 May 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058459; cv=none; b=OoSRPrI06+UUHephBqQ+hMuXJaprmGJCrTurIlHxK9kJ122ya7G3kbcmj/uG5+upJ8+DSu67D2AQPJfzX35TNL/2+ZYDJMdl1SQiNwOmKL7BJhchQ4n2e9yME0BRr417EzrooIna54V+5vvP2RffXqaa4GYspxmRLmP3Gzv4g0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058459; c=relaxed/simple;
	bh=ZecIICmpo29Ga9Umz+QC3v6/nYy0+CINnOYW1vg6bYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jbo85oUVRcitqaeOlvQ/3R6uRjUOte4LA/+vb/+2d5aSm1kshyBpgj0h4rAwgetsnYlVoxRQ3n3rlIuvWh73YrVRP5cRWVXCWRjXThpbGvqmwYNJNM7wNdTWV4ByBZzJym+WKWI3aBiWSHpqAYNnA/Qf43qSfQJdpCOJMivIZD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pr4rYFic; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pr4rYFic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7D11F00893;
	Fri, 29 May 2026 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780058458;
	bh=zm3OidSFwgLY7wEpcW0f3kKbY4eYHAKurNfBqmFwEMM=;
	h=From:To:Cc:Subject:Date;
	b=Pr4rYFicCNLoe7aY3SbNVvVErSthBrXvXoeaYNY3hGmDN4+SKL/oUcQkFNalnmXMR
	 VrRndI/jHIFRyE0hZpgZ0FuRmOftrkw9rDacvV8httBx4mK4XBA93144MmHYsBM038
	 /7MbEOzM94T8svOgRO5iGZfgXqYSpVpIopv1Wn63z2pG89E4FcHkkOtAUsvlaoxldE
	 Gjgu/EZhAd4aZTKl8HJkPBGZfJ7UBpEXOUvB/Y+zfs5Cb++5R6imCELHolcgDOoIDp
	 SuEdGGrDYhLl8tKtbgfSG0713mO5SraQDU/QP/nruYTMH5sy17537g9U5ojEPhd1Pt
	 KlFPGwHYHB2OQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: "Pratyush Yadav (Google)" <pratyush@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Daniel Verkamp <dverkamp@chromium.org>,
	Jeff Xu <jeffxu@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Hugh Dickins <hughd@google.com>,
	linux-man@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] man/man2const/F_{ADD,GET}_SEALS.2const: document F_SEAL_EXEC
Date: Fri, 29 May 2026 14:40:44 +0200
Message-ID: <20260529124047.1483026-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

F_SEAL_EXEC was added in Linux v6.3. It seals the exec bits of the
memfd. Document it.

Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---

Notes:
    I discovered this was missing when working on [0]. I had to look at the
    code to figure out how it was supposed to behave.
    
    Disclaimer: I used help from Gemini to write this patch, mainly because
    I don't know the man page syntax. If the man-pages project also uses the
    AI-assisted tags as Linux, feel free to add:
    
    Assisted-by: Gemini:gemini-3.1-pro
    
    [0] https://lore.kernel.org/linux-mm/20260505133922.797635-1-pratyush@kernel.org/

 man/man2const/F_GET_SEALS.2const | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/man/man2const/F_GET_SEALS.2const b/man/man2const/F_GET_SEALS.2const
index 175025c10..2de8009a8 100644
--- a/man/man2const/F_GET_SEALS.2const
+++ b/man/man2const/F_GET_SEALS.2const
@@ -176,6 +176,25 @@ will fail with
 Using this seal,
 one process can create a memory buffer that it can continue to modify
 while sharing that buffer on a "read-only" basis with other processes.
+.TP
+.BR F_SEAL_EXEC " (since Linux 6.3)"
+If this seal is set, the execute bits in the file mode cannot be modified.
+Any attempt to modify these bits via
+.BR chmod (2),
+.BR fchmod (2),
+or similar calls will fail with
+.BR EPERM .
+This preserves the execute bits as they were at the time of sealing,
+making the file either permanently executable or permanently unexecutable.
+.IP
+If this seal is applied to a file that is already executable,
+the kernel also implicitly applies
+.BR F_SEAL_SHRINK ,
+.BR F_SEAL_GROW ,
+.BR F_SEAL_WRITE ,
+and
+.BR F_SEAL_FUTURE_WRITE ,
+preventing any further modifications to the contents of the file.
 .SH RETURN VALUE
 .TP
 .B F_GET_SEALS

base-commit: 9db8ca91f920b9aba40ed68de6b8da0ca9dbefaa
-- 
2.54.0.1013.g208068f2d8-goog

