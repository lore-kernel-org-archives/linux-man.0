Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36D42F30
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 17:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024294; cv=none; b=ndGsltFFe+OtQVlfcHk8cI+J95Lujo4f7nSLROvsvD6KCUr/ntzvGj7nSYcD5lHpL/0bVpIERMAEGWhR/XguI2LrOz6sJjSoA5txHbAe+o28LB0dTSG90jOSA0CoNqVY7CDw98wxYzHSv+1U2U2fEHF3Q1afNZGH/TUr4/lP9JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024294; c=relaxed/simple;
	bh=Xi7wdzo6TY6iIR9kKjoi6ez+y0+ma+W4Li3u2QDIAvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WywN7H0uC2Kxz8x58POIE/FpW5S2sloTlTDe39ZEcB9IlSjOeyrmuoSkzyUAfV4X9TL63LCnYCjhVTEN+6QHmyjNey/XXmA2BxnnrQeutfZzsXE4W3KOvU2taokjYm8h+ge6TUXwLdbfP1ebujZX+sNKlEIPKvFCjBZREnGCkH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKUR+KW2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKUR+KW2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48436251906so144992f8f.0
        for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 10:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788024291; x=1788629091; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAzAFs9D/UCJA73R8T1hgJCudUYaiHeTzzZUGlWX/yg=;
        b=CKUR+KW2kktTHJLI/o9v8hhVNSyGWioEWxsvOFGlv9Eq26HYtVptiVrfZGRKWGvM+q
         +6wwoiLvy5gzReSZIWgD3ckSGmcsOfRFeQtZ1uZDr4M9N7IkjKIv1EtkxcY2J294QpNG
         S+/Yui585/EMP30f0NMG9qSrCEUUpdQcrzsCHyM++XZTIuJSuPM6Jm5yjMS9ZxtH3+GL
         JytFY6l97Q2+I3brIbOe9ctRpCdiKLuIC7QUcT3tYJRUx0lY26iTs2n4KLC9gNYWfzwV
         Xvlo3eygJD59zYgc2LqWIJGjPeOAnq/N38ho2Jv90JdPljrHus4IiRV/QRv3D1BztnlI
         Z+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788024291; x=1788629091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VAzAFs9D/UCJA73R8T1hgJCudUYaiHeTzzZUGlWX/yg=;
        b=qkwoswEQSso6xBW9hOHUcQ4UVswGCSEgIm0zI4Ikwq9eRw4J5+QldY5MqpB1QQsCIG
         EOgw47qf5MNoR1Rl2DI9YiSImVe0/JaoX2oPRzcvqiKsRbdeKA5pBgD8ON7WJRW/TGNw
         w6aoBqe+fNE+eNuQFkmEywLzPQD/2oHRjztw3E4dvhI4b+hjfrKc2SFU8CqIOwnhJFSJ
         5/RNnIWY0FuuMvFye0tMg+5pFbUUoJq8Wr7yPDFWVpcGH1tVbAF73K/w1l6N6TN9bfGt
         /bOLhQkZPL8vEB5oDFEZye6X31S2TJymSorcfcSZDTj5LHaov96tArmjXS8QS5jFNBsy
         Twdw==
X-Forwarded-Encrypted: i=1; AKwUvBy9WoGg3njpVPp3XTUe9tDL1+bo82a+xcYjJsuCfxP5DJ/8RHDN+BFBcs9w/ND8IXtDKxMA76zjgO8=@vger.kernel.org
X-Gm-Message-State: AFuF++nJN7Z0FWSZYOQdf5TgDt0Ci5/sBkgDfGPJ7BzxvPwaBrHLstkf
	9P822MA24vufcxjCXXbHHOh80nHImW/GHpUr5b3PAn7VXqUflklXPEZg/6zI7Apd
X-Gm-Gg: AYBFou0pTWce/djsm0mNec60sMaTijxWF4ldpfDxegrb1G5sqjOyqS/7Ajyx63W6pX1
	Plqh20UZUNbNosfp2emyROBvOOm+vYt//Xw0n4xLwNXpPvk0yhRpHRecitF9qXim62/cwoN755j
	vkL5ZnrCI8uj6mBnOriZV9jPtO3fTvtYKgCfwuEU+6EYtWMt2WLUPsKhWihm2Tgdomorvd7fVwC
	wrpL1mTzgHKvvsne85nrUU5vMQjQs+/z+pmI+31pdTGkAUChW4WiG2psevBitFMSiJjWKLPkPDr
	dxwSjShSVkvRuYF6knzoTKacdRP5KkKZJnVo6slo6P9QrDsnevBe3I3VJ4zCYVY4K6m5i2NdjeC
	xuJ9ytXe9dy6mMVRo0+8XjMPNrSxt0tuVecNOFUReZNLyAH2E3CQt1ObKsrDWIR0p+pjTQvTIBv
	MdDTdM0cY/CdqvJGM4SFvsWcWp+917C5+S9DlOiCPnXHJPX4JN1N0LSfHAyQ4Cqe3UZQZKqqoGq
	/omP9nawYMPt91+QEtcYEkyzQ==
X-Received: by 2002:a05:6000:2904:b0:482:ea9b:962c with SMTP id ffacd0b85a97d-482f79c91e1mr26413059f8f.22.1788024290364;
        Sat, 29 Aug 2026 10:24:50 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac8e61sm10894162f8f.13.2026.08.29.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:24:50 -0700 (PDT)
Date: Sat, 29 Aug 2026 19:24:45 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Tingmao Wang <m@maowtm.org>
Cc: Alejandro Colomar <alx@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-man@vger.kernel.org
Subject: Re: [PATCH v2] landlock.7, landlock_*.2: Document
 LANDLOCK_ADD_RULE_QUIET
Message-ID: <20260829.acedcd1feb62@gnoack.org>
References: <20260829151304.101952-1-m@maowtm.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829151304.101952-1-m@maowtm.org>

Thank you very much, Tingmao!

Documentation is the same as in the kernel docs, and renders fine.  I
left a few smaller comments below on individual points.  Apart from
these this looks good. :)

On Sat, Aug 29, 2026 at 04:13:03PM +0100, Tingmao Wang wrote:
> LANDLOCK_ADD_RULE_QUIET is a new feature introduced in Landlock ABI
> version 10, merged in kernel v7.2 [1].  This patch copies relevant
> kernel documentation into man-pages.
> 
> Link: <https://patch.msgid.link/cover.1781228815.git.m@maowtm.org/> [1]
> Signed-off-by: Tingmao Wang <m@maowtm.org>
> ---
> 
> Changes in v2:
> - Fix missing .RE, and fix EINVAL label being incorrectly formatted
> - Fix missed API bump in the example program (abi = MIN(abi, 10);)
> 
> Hi,
> 
> For context, I'm the author of the quiet flag feature and this is my
> first man-pages patch.  @Günther or @Mickaël, can one of you do a quick review?
> 
> All text in this patch is copied from the kernel source except this
> bit:
>     .TP
>     .B EINVAL
>     .I flags
>     is not 0 or one of the allowed values.
> 
> (the kernel says "%EINVAL: @flags is not valid", I decided to make it
> more precise)
> 
>  man/man2/landlock_add_rule.2       | 48 ++++++++++++++++++++++++++++--
>  man/man2/landlock_create_ruleset.2 | 48 ++++++++++++++++++++++++++++++
>  man/man7/landlock.7                | 29 +++++++++++++++++-
>  3 files changed, 121 insertions(+), 4 deletions(-)
> 
> diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> index fe01a98d9..c848c9b4b 100644
> --- a/man/man2/landlock_add_rule.2
> +++ b/man/man2/landlock_add_rule.2
> @@ -120,7 +120,44 @@ .SH DESCRIPTION
>  and it will automatically translate to binding on the related port range.
>  .P
>  .I flags
> -must be 0.
> +can either be 0 or contain:
> +.TP
> +.BR LANDLOCK_ADD_RULE_QUIET "  (since Landlock ABI version 10)"
> +Together with the
> +.I quiet_*
> +fields in
> +.IR "struct landlock_ruleset_attr" ,
> +this flag controls whether Landlock will log audit messages when
> +access to the objects covered by this rule is denied by this layer.
> +.IP
> +If logging is enabled, when Landlock denies an access,
> +it will suppress the log if all of the following are true:
> +.RS
> +.IP \[bu] 3
> +this layer is the innermost layer that denied the access;
> +.IP \[bu]
> +all accesses denied by this layer are part of the
> +.I quiet_*
> +fields in the related
> +.IR "struct landlock_ruleset_attr" ;
> +.IP \[bu]
> +the object (or one of its parents, for filesystem rules) is
> +marked as "quiet" via
> +.BR LANDLOCK_ADD_RULE_QUIET .
> +.RE
> +.IP
> +Because logging is only suppressed by a layer if the layer denies
> +access,

(I suspect Alejandro will bring it up as well; man pages use "semantic
line breaks" trying to break lines after logical parts of a sentence,
e.g.

  Because logging is only suppressed by a layer
  if the layer denies access,

etc.)

> +a sandboxed program cannot use this flag to "hide" access denials,
> +without denying itself the access in the first place.
> +.IP
> +The effect of this flag does not depend on the value of
> +.I allowed_access
> +in the passed in
> +.IR rule_attr .
> +When this flag is present, the caller is also allowed to pass in an
> +empty

(Also here, please use semantic line breaks so that "empty" does not
stand on its own line.)

> +.IR allowed_access .
>  .SH RETURN VALUE
>  On success,
>  .BR landlock_add_rule ()
> @@ -159,7 +196,7 @@ .SH ERRORS
>  .TP
>  .B EINVAL
>  .I flags
> -is not 0.
> +is not 0 or one of the allowed values.
>  .TP
>  .B EINVAL
>  The rule accesses are inconsistent (i.e.,
> @@ -181,10 +218,15 @@ .SH ERRORS
>  .IR \%struct\~landlock_net_port_attr ,
>  the port number is greater than 65535.
>  .TP
> +.B EINVAL
> +.B LANDLOCK_ADD_RULE_QUIET
> +is passed but the ruleset has no quiet access bits set for the
> +corresponding rule type.

(Maybe semantic line breaks as well)

> +.TP
>  .B ENOMSG
>  Empty accesses (i.e.,
>  .I rule_attr\->allowed_access
> -is 0).
> +is 0) and no flags.
>  .TP
>  .B EOPNOTSUPP
>  Landlock is supported by the kernel but disabled at boot time.
> diff --git a/man/man2/landlock_create_ruleset.2 b/man/man2/landlock_create_ruleset.2
> index 2a33fa4b5..8611e3aba 100644
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
> +is a bitmask of filesystem actions which should not be logged if
> +per-object quiet flag is set.

Maybe add a "the" before "per-object" here?  Unlike in the kernel
docs, this is a full sentence here, so a more complete sentence is
probably in order?  (Same for quiet_access_net and quiet_scoped below
as well.)

> +.IP
> +.I quiet_access_net
> +is a bitmask of network actions which should not be logged if
> +per-object quiet flag is set.
> +.IP
> +.I quiet_scoped
> +is a bitmask of scoped actions which should not be logged.
> +.IP
>  This structure defines a set of
>  .IR "handled access rights" ,
>  a set of actions on different object types,
> @@ -100,6 +114,29 @@ .SH DESCRIPTION
>  a wide range or all access rights that they know about at build time
>  (and that they have tested with a kernel that supported them all).
>  .IP
> +.I quiet_access_fs
> +and
> +.I quiet_access_net
> +are bitmasks of actions for which a denial by this layer will not
> +trigger a log if the corresponding object (or its children, for
> +filesystem rules) is marked with the "quiet" bit via

(line breaks)

> +.BR LANDLOCK_ADD_RULE_QUIET ,
> +even if logging would normally take place per
> +.BR landlock_restrict_self (2)
> +flags.
> +.I quiet_scoped
> +is similar, except that it does not require marking any objects as quiet
> +-

Should maybe be a \[em]?

> +if the ruleset is created with any bits set in
> +.IR quiet_scoped ,
> +then denial
> +of such scoped resources will not trigger any log.
> +These 3 fields are available since Landlock ABI version 10
> +(see
> +.B Quiet rule flag
> +in
> +.BR landlock (7)).

Compared to the header file, you dropped the sentence

    @quiet_access_fs, @quiet_access_net and @quiet_scoped must be a
    subset of @handled_access_fs, @handled_access_net and @scoped
    respectively.

This looks unintentional?


> +.IP
>  This structure can grow in future Landlock versions.
>  .P
>  .I size
> @@ -204,6 +241,17 @@ .SH ERRORS
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
> index 880dd5058..402e35cbe 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -456,6 +456,31 @@ .SS Truncating files
>  It is also possible to pass such file descriptors between processes,
>  keeping their Landlock properties,
>  even when these processes do not have an enforced Landlock ruleset.
> +.SS Quiet rule flag
> +Starting with the Landlock ABI version 10,
> +it is possible to selectively suppress logs for specific denied
> +accesses on a per-object basis with the
> +.B LANDLOCK_ADD_RULE_QUIET
> +flag of
> +.BR landlock_add_rule (2),
> +in combination with the
> +.B quiet_access_fs
> +and
> +.B quiet_access_net
> +fields
> +of
> +.IR "struct landlock_ruleset_attr" .
> +It is also now possible to suppress
> +logs for scope accesses via the
> +.B quiet_scoped
> +field of
> +.IR "struct landlock_ruleset_attr" .
> +The object is marked as quiet within a ruleset when at least one
> +.BR landlock_add_rule (2)
> +call is made for it with the
> +.B LANDLOCK_ADD_RULE_QUIET
> +flag, additional add-rule calls for the same object without this flag
> +do not clear it.
>  .SH VERSIONS
>  Landlock was introduced in Linux 5.13.
>  .P
> @@ -500,6 +525,8 @@ .SH VERSIONS
>  8	7.0	LANDLOCK_RESTRICT_SELF_TSYNC
>  _	_	_
>  9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
> +_	_	_
> +10	7.2	LANDLOCK_ADD_RULE_QUIET
>  .TE
>  .P
>  Users should use the Landlock ABI version rather than the kernel version
> @@ -622,7 +649,7 @@ .SH EXAMPLES
>      perror("Unable to use Landlock");
>      return;  /* Graceful fallback: Do nothing.  */
>  }
> -abi = MIN(abi, 9);
> +abi = MIN(abi, 10);

Please also add an entry to the array in the example (even though it
is the same as the entry before, in this case).  Otherwise, the
example has an out-of-bounds array access when this is 10.

>  \&
>  /* Only use the available rights in the ruleset.  */
>  attr.handled_access_fs &= landlock_fs_access_rights[abi \- 1];
> -- 
> 2.55.0
> 

Thanks,
–Günther
