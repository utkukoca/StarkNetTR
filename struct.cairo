%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin

struct User:
    member first_name: felt
    member last_name: felt
    member account: felt
end

@storage_var
func user_voted(user: User) ->(res:felt):
end

@view
func user_view_voted{syscall_ptr: felt*, pedersen_ptr :HashBuiltin*, range_check_ptr}(
     user:User
) -> (user_view_voted:felt):
     let(user_view_voted) =user_voted.read(user)
     return (user_view_voted)
end

@external 
func vote{syscall_ptr: felt*, pedersen_ptr :HashBuiltin*, range_check_ptr
}(user:User): 
   user_voted.write(user,1)
   return()
end
 
