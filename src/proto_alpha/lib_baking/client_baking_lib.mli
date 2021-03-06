(**************************************************************************)
(*                                                                        *)
(*    Copyright (c) 2014 - 2016.                                          *)
(*    Dynamic Ledger Solutions, Inc. <contact@tezos.com>                  *)
(*                                                                        *)
(*    All rights reserved. No warranty, explicit or implicit, provided.   *)
(*                                                                        *)
(**************************************************************************)

open Proto_alpha
open Alpha_context

(** Mine a block *)
val bake_block:
  #Proto_alpha.full ->
  Block_services.block ->
  ?force:bool ->
  ?max_priority: int ->
  ?free_baking: bool ->
  ?minimal_timestamp: bool ->
  ?src_sk:Client_keys.sk_locator ->
  public_key_hash ->
  unit tzresult Lwt.t

(** Endorse a block *)
val endorse_block:
  #Proto_alpha.full ->
  ?max_priority:int ->
  Client_keys.Public_key_hash.t ->
  unit Error_monad.tzresult Lwt.t

(** Get the previous cycle of the given cycle *)
val get_predecessor_cycle:
  #Proto_alpha.full ->
  Cycle.t ->
  Cycle.t Lwt.t

(** Reveal the nonces used to bake each block in the given list *)
val reveal_block_nonces :
  #Proto_alpha.full ->
  Block_hash.t list ->
  unit Error_monad.tzresult Lwt.t

(** Reveal all unrevealed nonces *)
val reveal_nonces :
  #Proto_alpha.full ->
  unit ->
  unit Error_monad.tzresult Lwt.t

(** Initialize the baking daemon *)
val run_daemon:
  #Proto_alpha.full ->
  ?max_priority:int ->
  endorsement_delay:int ->
  public_key_hash list ->
  endorsement:bool ->
  baking:bool ->
  denunciation:bool ->
  unit Error_monad.tzresult Lwt.t
