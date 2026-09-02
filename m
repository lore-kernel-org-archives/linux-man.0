Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6947447ECCC
	for <linux-man@vger.kernel.org>; Wed,  2 Sep 2026 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361767; cv=none; b=t3WAW0bWj7Zx36KptomfUyPiigDz0pqLsotiolqZ1mnzCgUGRED+CMEo5oCZV0Ou2gm37cpYGtbFhuN03kPD3KcejGQ1K14aAWFKO9aqR1XxT4J7vazCFUERGFsDvDRMwm6TIbBjwzA6Mpn6SMzAcHlFVPiBy/7Dfa3HpvVh1cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361767; c=relaxed/simple;
	bh=6zSrBjL8Dw0NcvWoYDuaIxcIrITgWxg0qV9CYz/Usn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7/PBt2YLpfGFSi8RocIjvem8BdIxFxmC+vE4h4qHBazO1tqKh4RuOeWkHLy6GLeQ+rtfF9itOSmyAAToQA+uOrzw8dyLam2HGZBPco8z8rQKq8jh4LABgeQf5hKsaelNeONGv5g4mMCfDaprxKXhbEoOHd1vjJRAHkOfbm1PCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EgkHzx/A; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EgkHzx/A"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso10916475e9.0
        for <linux-man@vger.kernel.org>; Wed, 02 Sep 2026 08:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788361761; x=1788966561; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p02vrRPvsEwg2lactRqaFEdDtZ/XpdnbkzzlBRhoMDQ=;
        b=EgkHzx/AGj2V197VPSs6Xo3PxSngesGcqvMo7n75BZTJcM9KuSXX6a6jCHCZD4J78T
         nxZ+oH/Y2TIIZHdXG0vo+zztW6RAQiOe8kQbXS3c42QaC6Lxbva1xJuXWxc1hrD81atn
         O5ydhpLJDp/GQkszoR1ZwLMEyGTKc4C0ogaUWRPKBSQxVh8m2m4pPoRVFdb0tQUB3JgN
         HHaQoFBAjC7/MotGGG4n7X1hasSKuuHUUIxUmDM+KbRSlxIbPC96Ts0U1IKBFl/+c8p6
         oJT395sHEu5vWDpn6gySGHbFlgKNIOYKRSbIfEDmOasvxjm9Dts9mSIzBP8EXmIw5200
         wTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361761; x=1788966561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p02vrRPvsEwg2lactRqaFEdDtZ/XpdnbkzzlBRhoMDQ=;
        b=J3qtt1iQuhhK74IdnZEoLsiXyVMCx17+Oqb9bPJ4yKm1LBvBdDkDVh0yUnYXsdNWRY
         pHKqzXeb35BIA5VgWX6vb4ekZ1+YEc7JhV8l+8oYSDC9sQef2HdZMPgtPE2ZgUNCWVmV
         8hHiTsQu26qls4RZbYSoWiWaAv5SnNU/thjoxB6lgDvaZQ/1DBbc43GJLTbWlircEHeV
         zKUenlED1gE8K/FZ7fybyOVLB6wPJ9u/vFz/7n3udKRyeaQnb01ndFtsKYiWUUwvwZty
         xdm7My9yVL7NH5Wfamprp80RpVuIrnFRB/i5PxcYNB4mXNB2/rDsNHOJX+u0vPi+mVdl
         IB+w==
X-Forwarded-Encrypted: i=1; AHgh+RoJeTE8g5MQMOxH8Nf54LJ93dbmj5nQIM4beou3W8uaN2yxGxCnixtRfQctWMsRgd+1j5i+MbezCoU=@vger.kernel.org
X-Gm-Message-State: AFuF++nAgaoSdssOHMKFT3/m2s25JX3NfeyxhanH5e2q8Kv1H1VZzLdX
	UzM12nibsGqAXwg8luQAvAajZyKikoZtgbW0KqesM7YVm54icBNuH2/ti+FRMMuboQ==
X-Gm-Gg: AR+sD10rTp4vbdbICel7Itipp01jtGkEKKMByaZPU5VkoGJS1FMVtWtOqyQYoktSkZv
	ob9XcJG8n5aB9qVw6riHrEWBOIZ54899HhcrrKhaawCqT+LJcMx6WX4s2xvqM0GzO8s0pjQttr9
	0E23kC546m/pp5eSjb+eKLFlutaHgC08oZ/p2aT/04HB2BfjFYqUSO0T4L7kRuwRFKYTyOv1Z9C
	+AnnA3c/aoEezD8zYLv6Z5DPsQUgle7GZlefV/gQ+jYDKFXJ9yIBI9NjAfYRdxyXwqdNfVkBJcN
	PBG5HOzwDI+GnCvRlwIIyRVslcXNOdkZLh7fuFsuFlAfItuTWYOJGU/ni08YAvS2BDiwbVwacwS
	KVRwc1PM1dTxZhy2ISIhnEfQj7TLMSTZpDO+zWySCUUFQ0w4GXrpLHrm71+vU0IAXkB5qjYZDMb
	EhEz/Zrt1YxkXtXS6JJ3yk8REPVOKDzqUzMKYyNcM/CmMgzESWuusTA3F1jcyz3c8Z3PhKG0o5r
	3f1IbhVFC/KeCqyXmw=
X-Received: by 2002:a05:600c:3152:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49ce5815e71mr103534295e9.9.1788361760336;
        Wed, 02 Sep 2026 08:09:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:de5d:9fa4:860d:bbba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm40317295e9.2.2026.09.02.08.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:09:19 -0700 (PDT)
Date: Wed, 2 Sep 2026 17:09:10 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: Tingmao Wang <m@maowtm.org>
Cc: Alejandro Colomar <alx@kernel.org>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH v4] landlock.7, landlock_*.2: Document
 LANDLOCK_ADD_RULE_QUIET
Message-ID: <apg8FsPOChcB-tJh@google.com>
References: <20260901234202.1608520-1-m@maowtm.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901234202.1608520-1-m@maowtm.org>

On Wed, Sep 02, 2026 at 12:42:02AM +0100, Tingmao Wang wrote:
> LANDLOCK_ADD_RULE_QUIET is a new feature introduced in Landlock ABI
> version 10, merged in kernel v7.2 [1].  This patch copies relevant
> kernel documentation into man-pages.
> 
> Link: <https://patch.msgid.link/cover.1781228815.git.m@maowtm.org/> [1]
> Signed-off-by: Tingmao Wang <m@maowtm.org>
> ---
> 
> Changes in v4:
> Applied review suggestions:
> - \em to parentheses
> - can either be 0 or contain -> is a bit mask of the following optional flags
> - .IR quiet_ *
> - .IR \%struct\~landlock_ruleset_attr .
> - Fix more semantic line breaks
> - EINVAL flags "is not 0 or one of the allowed values" -> "is not valid"
> - bitmask -> bit mask
> 
> Changes in v3:
> - Fix out of bound array access in example caused by incrementing abi
>   maximum but forgetting to also append the array.
> - Semantic line breaks
> - Add accidentally dropped lines:
>     @quiet_access_fs, @quiet_access_net and @quiet_scoped must be a
>     subset of @handled_access_fs, @handled_access_net and @scoped
>     respectively.
>   Thanks Günther!
> 
> Changes in v2:
> - Fix missing .RE, and fix EINVAL label being incorrectly formatted
> - Fix missed API bump in the example program (abi = MIN(abi, 10);)
> 
> For context, I'm the author of the quiet flag feature.
> 
> All text in this patch is copied from the kernel source except updates
> requested in review of this patch.
> 
>  man/man2/landlock_add_rule.2       | 53 ++++++++++++++++++++++++--
>  man/man2/landlock_create_ruleset.2 | 60 ++++++++++++++++++++++++++++++
>  man/man7/landlock.7                | 34 ++++++++++++++++-
>  3 files changed, 143 insertions(+), 4 deletions(-)
> 
> diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> index fe01a98d9..94bc63068 100644
> --- a/man/man2/landlock_add_rule.2
> +++ b/man/man2/landlock_add_rule.2
> @@ -120,7 +120,47 @@ .SH DESCRIPTION
>  and it will automatically translate to binding on the related port range.
>  .P
>  .I flags
> -must be 0.
> +is a bit mask of the following optional flags:
> +.TP
> +.BR LANDLOCK_ADD_RULE_QUIET "  (since Landlock ABI version 10)"
> +Together with the
> +.IR quiet_ *
> +fields in
> +.IR \%struct\~landlock_ruleset_attr ,
> +this flag controls whether Landlock will log audit messages when
> +access to the objects covered by this rule is denied by this layer.
> +.IP
> +If logging is enabled,
> +when Landlock denies an access,
> +it will suppress the log if all of the following are true:
> +.RS
> +.IP \[bu] 3
> +this layer is the innermost layer that denied the access;
> +.IP \[bu]
> +all accesses denied by this layer are part of the
> +.IR quiet_ *
> +fields in the related
> +.IR \%struct\~landlock_ruleset_attr ;
> +.IP \[bu]
> +the object
> +(or one of its parents, for filesystem rules)
> +is marked as "quiet" via
> +.BR LANDLOCK_ADD_RULE_QUIET .
> +.RE
> +.IP
> +Because logging is only suppressed by a layer
> +if the layer denies access,
> +a sandboxed program cannot use this flag
> +to "hide" access denials,
> +without denying itself the access in the first place.
> +.IP
> +The effect of this flag does not depend on the value of
> +.I allowed_access
> +in the passed in
> +.IR rule_attr .
> +When this flag is present,
> +the caller is also allowed to pass in an empty
> +.IR allowed_access .
>  .SH RETURN VALUE
>  On success,
>  .BR landlock_add_rule ()
> @@ -159,7 +199,7 @@ .SH ERRORS
>  .TP
>  .B EINVAL
>  .I flags
> -is not 0.
> +is not valid.
>  .TP
>  .B EINVAL
>  The rule accesses are inconsistent (i.e.,
> @@ -181,10 +221,17 @@ .SH ERRORS
>  .IR \%struct\~landlock_net_port_attr ,
>  the port number is greater than 65535.
>  .TP
> +.B EINVAL
> +.B LANDLOCK_ADD_RULE_QUIET
> +is passed
> +but the ruleset has no quiet access bits set
> +for the corresponding rule type.
> +.TP
>  .B ENOMSG
>  Empty accesses (i.e.,
>  .I rule_attr\->allowed_access
> -is 0).
> +is 0)
> +and no flags.
>  .TP
>  .B EOPNOTSUPP
>  Landlock is supported by the kernel but disabled at boot time.
> diff --git a/man/man2/landlock_create_ruleset.2 b/man/man2/landlock_create_ruleset.2
> index 2a33fa4b5..85df03668 100644
> --- a/man/man2/landlock_create_ruleset.2
> +++ b/man/man2/landlock_create_ruleset.2
> @@ -45,6 +45,9 @@ .SH DESCRIPTION
>      __u64 handled_access_fs;
>      __u64 handled_access_net;
>      __u64 scoped;
> +    __u64 quiet_access_fs;
> +    __u64 quiet_access_net;
> +    __u64 quiet_scoped;
>  };
>  .EE
>  .in
> @@ -70,6 +73,17 @@ .SH DESCRIPTION
>  in
>  .BR landlock (7)).
>  .IP
> +.I quiet_access_fs
> +is a bit mask of filesystem actions which should not be logged
> +if the per-object quiet flag is set.
> +.IP
> +.I quiet_access_net
> +is a bit mask of network actions which should not be logged
> +if the per-object quiet flag is set.
> +.IP
> +.I quiet_scoped
> +is a bit mask of scoped actions which should not be logged.
> +.IP
>  This structure defines a set of
>  .IR "handled access rights" ,
>  a set of actions on different object types,
> @@ -100,6 +114,41 @@ .SH DESCRIPTION
>  a wide range or all access rights that they know about at build time
>  (and that they have tested with a kernel that supported them all).
>  .IP
> +.I quiet_access_fs
> +and
> +.I quiet_access_net
> +are bit masks of actions for which a denial by this layer
> +will not trigger a log
> +if the corresponding object
> +(or its children, for filesystem rules)
> +is marked with the "quiet" bit via
> +.BR LANDLOCK_ADD_RULE_QUIET ,
> +even if logging would normally take place per
> +.BR landlock_restrict_self (2)
> +flags.
> +.I quiet_scoped
> +is similar,
> +except that it does not require marking any objects as quiet
> +(if the ruleset is created with any bits set in
> +.IR quiet_scoped ,
> +then denial of such scoped resources will not trigger any log).
> +These 3 fields are available since Landlock ABI version 10
> +(see
> +.B Quiet rule flag
> +in
> +.BR landlock (7)).
> +.IP
> +.IR quiet_access_fs ,
> +.I quiet_access_net
> +and
> +.I quiet_scoped
> +must be a subset of
> +.IR handled_access_fs ,
> +.I handled_access_net
> +and
> +.I scoped
> +respectively.
> +.IP
>  This structure can grow in future Landlock versions.
>  .P
>  .I size
> @@ -204,6 +253,17 @@ .SH ERRORS
>  or
>  .BR LANDLOCK_CREATE_RULESET_ERRATA .
>  .TP
> +.B EINVAL
> +.IR quiet_access_fs ,
> +.IR quiet_access_net ,
> +or
> +.I quiet_scoped
> +is not a subset of the corresponding
> +.IR handled_access_fs ,
> +.IR handled_access_net ,
> +or
> +.IR scoped .
> +.TP
>  .B ENOMSG
>  Empty accesses (i.e.,
>  .I attr
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index 880dd5058..ad63826da 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -456,6 +456,35 @@ .SS Truncating files
>  It is also possible to pass such file descriptors between processes,
>  keeping their Landlock properties,
>  even when these processes do not have an enforced Landlock ruleset.
> +.SS Quiet rule flag
> +Starting with the Landlock ABI version 10,
> +it is possible to selectively suppress logs
> +for specific denied accesses
> +on a per-object basis with the
> +.B LANDLOCK_ADD_RULE_QUIET
> +flag of
> +.BR landlock_add_rule (2),
> +in combination with the
> +.B quiet_access_fs
> +and
> +.B quiet_access_net
> +fields
> +of
> +.IR \%struct\~landlock_ruleset_attr .
> +It is also now possible to suppress logs
> +for scope accesses via the
> +.B quiet_scoped
> +field of
> +.IR \%struct\~landlock_ruleset_attr .
> +The object is marked as quiet within a ruleset
> +when at least one
> +.BR landlock_add_rule (2)
> +call is made for it with the
> +.B LANDLOCK_ADD_RULE_QUIET
> +flag,
> +additional add-rule calls
> +for the same object without this flag
> +do not clear it.
>  .SH VERSIONS
>  Landlock was introduced in Linux 5.13.
>  .P
> @@ -500,6 +529,8 @@ .SH VERSIONS
>  8	7.0	LANDLOCK_RESTRICT_SELF_TSYNC
>  _	_	_
>  9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
> +_	_	_
> +10	7.2	LANDLOCK_ADD_RULE_QUIET
>  .TE
>  .P
>  Users should use the Landlock ABI version rather than the kernel version
> @@ -610,6 +641,7 @@ .SH EXAMPLES
>      (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v7: same
>      (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v8: same
>      (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v9: add "resolve_unix"
> +    (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v10: same
>  };
>  \&
>  int abi = landlock_create_ruleset(NULL, 0,
> @@ -622,7 +654,7 @@ .SH EXAMPLES
>      perror("Unable to use Landlock");
>      return;  /* Graceful fallback: Do nothing.  */
>  }
> -abi = MIN(abi, 9);
> +abi = MIN(abi, 10);
>  \&
>  /* Only use the available rights in the ruleset.  */
>  attr.handled_access_fs &= landlock_fs_access_rights[abi \- 1];
> -- 
> 2.55.0

Reviewed-by: Günther Noack <gnoack@google.com>
